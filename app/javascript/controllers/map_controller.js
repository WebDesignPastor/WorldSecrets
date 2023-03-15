import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    departureMarkers: Array
  }

  connect() {
    let points = `${this.departureMarkersValue[0].lng},${this.departureMarkersValue[0].lat}`
    this.markersValue.forEach((marker) => {
      points += `;${marker.lng},${marker.lat}`
    })


    fetch(`https://api.mapbox.com/directions/v5/mapbox/walking/${points}?alternatives=false&geometries=geojson&overview=full&steps=false&access_token=pk.eyJ1IjoiZmFuY2hwYXN0b3IiLCJhIjoiY2xlemx6NHY3MDBpdDQ2cGQ3YzBsb2lqZiJ9.g3kiJShO73ktvZhIa_6lrQ`)
      .then(response => response.json())
      .then((data) =>  {
        mapboxgl.accessToken = this.apiKeyValue
        this.coordinates = data.routes[0].geometry.coordinates


        this.map = new mapboxgl.Map({
          container: this.element,
          zoom:1,
          center: [this.departureMarkersValue[0].lng, this.departureMarkersValue[0].lat],
          style: "mapbox://styles/fanchpastor/cleztoc72003801o3sccvya6t"
        })

        this.steps = 1000

        const line = turf.lineString(this.coordinates)
        const lineDistance = turf.length(line)
        this.totalDistance = lineDistance

        this.arc = []
        for (let i = 0; i < lineDistance; i += lineDistance / this.steps) {
          const segment = turf.along(line, i)
          this.arc.push(segment.geometry.coordinates)
        }


        this.map.on('load', () => {
          this.direction = new MapboxDirections({
            accessToken: mapboxgl.accessToken,
            profile: 'mapbox/walking',
            unit: 'metric',
            // flyTo: false,x
            // interactive: false
          })


          this.point = {
            'type': 'FeatureCollection',
            'features': [
              {
                'type': 'Feature',
                'properties': {},
                'geometry': {
                  'type': 'Point',
                  'coordinates': [this.departureMarkersValue[0].lng, this.departureMarkersValue[0].lat]
                }
              }
            ]
          }

          this.counter = 0
          this.running = true
          this.count = 0
          this.direction.setOrigin([this.departureMarkersValue[0].lng, this.departureMarkersValue[0].lat])
          const lastMarker = this.markersValue.slice(-1)
          this.direction.setDestination([lastMarker[0].lng, lastMarker[0].lat])
          this.markersValue.slice(0, -1).forEach((marker, index) => {
            this.direction.addWaypoint(index, [marker.lng, marker.lat])
          })

          // this.map.addControl(
          //   this.direction,
          //   'top-left'
          // )
          const urlCustomMarker = this.element.dataset.customMarker

          this.map.loadImage(
            urlCustomMarker,
            (error, image) => {
              if (error) throw error;

              this.map.addImage('custom-marker', image);
              // Add a GeoJSON source with 2 points

              this.map.addSource('point', {
                'type': 'geojson',
                'data': this.point
              });

              this.map.addLayer({
                'id': 'point',
                'source': 'point',
                'type': 'symbol',
                'layout': {
                  'icon-image': 'custom-marker',
                  'icon-size': 1.5,
                  'icon-rotate': ['get', 'bearing'],
                  'icon-rotation-alignment': 'map',
                  'icon-allow-overlap': true,
                  'icon-ignore-placement': true
                }
              });

              animate(this.counter)
            }
          )
        })

        const animate = () => {
          if (this.running) {
            const start = this.arc[
              this.counter >= this.steps ? this.counter - 1 : this.counter
            ]
            const end = this.arc[
              this.counter >= this.steps ? this.counter : this.counter + 1
            ]
            if (!start || !end) {
              return
            }

            this.point.features[0].geometry.coordinates = this.arc[this.counter]

            // Update the source with this new data
            this.map.getSource('point').setData(this.point)
            this.map.setCenter(this.point.features[0].geometry.coordinates)

            // Request the next frame of animation as long as the end has not been reached
          }
          if (this.counter <= this.steps) {
            requestAnimationFrame(animate)
            if (this.running) {
              this.counter = this.counter + 1
            }
          }
        }


        this.#addMarkersToMap(this.departureMarkersValue, 0)
        this.#addMarkersToMap(this.markersValue)
        this.#fitMapToMarkers(this.departureMarkersValue)
        this.#fitMapToMarkers(this.markersValue)
      })

      document.addEventListener('click', (e) => {
        if (this.count == 0){
          this.running = false
          this.count += 1
        } else if (this.count == 1) {
          this.running = true
          this.count += 1
        } else if (this.count == 2) {
          this.running = false
          this.count += 1
        } else if (this.count == 3) {
          this.running = true
          this.count += 1
        } else if (this.count == 4) {
          this.running = false
          this.count += 1
        } else if (this.count == 5) {
          this.count += 1
        } else if (this.count == 6) {
          this.count += 1
        } else if (this.count == 7) {
          this.running = true
          this.count += 1
        } else if (this.count == 8) {
          this.running = false
          this.count += 1
        } else if (this.count == 9) {
          this.running = true
          this.count += 1
        } else if (this.count == 10) {
          this.running = false
          this.count += 1
        } else if (this.count == 11) {
          this.running = true
          this.count += 1
        } else if (this.count == 12) {
          this.running = false
          this.count += 1
        }
      })
  }

  #addMarkersToMap(markers, i = null) {
    markers.forEach((marker, index) => {
      let poiMarker = document.createElement('div')
      poiMarker.className = 'poi-marker'
      poiMarker.dataset.modalTarget = `poiMarker${i === null ? index + 1 : i}`
      new mapboxgl.Marker(poiMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
