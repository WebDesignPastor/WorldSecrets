import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    departureMarkers: Array
  }

  currentIndex = 0

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    // Create a new map centered on the user's location.
    navigator.geolocation.getCurrentPosition(position => {
      const { latitude, longitude } = position.coords;
      this.map = new mapboxgl.Map({
        container: this.element,
        zoom: 16,
        center: [longitude, latitude],
        style: "mapbox://styles/fanchpastor/cleztoc72003801o3sccvya6t",
      });

      // Add the geolocate control to the map.
      this.map.addControl(
        new mapboxgl.GeolocateControl({
          positionOptions: {
            enableHighAccuracy: true,
          },
          trackUserLocation: true,
          showUserHeading: true,
        })
      )

      // Add a departure marker.
      this.#addMarkersToMap(this.departureMarkersValue)
      this.#fitMapToMarkers(this.departureMarkersValue)

      // Add a marker for the user's location.
      const customMarkerUrl = this.element.dataset.customMarker
      const customMarker = document.createElement('img')
      customMarker.src = customMarkerUrl;
      this.marker = new mapboxgl.Marker({
          element: customMarker,
          anchor: 'bottom',
        })
          .setLngLat([longitude, latitude])
          .addTo(this.map)

      // Add markers for pois
      this.#addMarkersToMap(this.markersValue)
      this.#fitMapToMarkers(this.markersValue)

      // Initialize an array to keep old positions in memory.
      this.positions = []

      // Move the map to follow the user's location.
      navigator.geolocation.watchPosition(position => {
        const { latitude, longitude } = position.coords

        // Add the new position to the start of the array.
        this.positions.unshift([longitude, latitude])

        // Remove the last position from the end of the array.
        const N = 20; // Keep the last 20 locations.
        if (this.positions.length > N) {
          this.positions.pop();
        }

        // Calculate the average position.
        let averageLatitude = 0;
        let averageLongitude = 0;
        this.positions.forEach(pos => {
          averageLatitude += pos.latitude;
          averageLongitude += pos.longitude;
        });
        averageLatitude /= this.positions.length;
        averageLongitude /= this.positions.length;


        this.marker.setLngLat([longitude, latitude])
        this.map.flyTo({
          center: [longitude, latitude],
          speed: 0.1,
          zoom: 16,
        })



        // Check if the user is within 20 meters of any marker in this.markersValue
        const currentMarker = this.markersValue[this.currentIndex]
        const distance = this.distance(latitude, longitude, currentMarker.lat, currentMarker.lng)

        if (distance <= 20) {
          this.hideModal()
          this.showWarmerModal()
        } else if (distance <= 50) {
          this.hideModal()
          this.showWarmModal()
        } else if (distance <= 100) {
          this.showColdModal()
        }
      })
    })


    this.showPoi()
    this.continue()
  }

  distance(lat1, lon1, lat2, lon2) {
    const R = 6371e3; // Earth's radius in meters
    const dLat = (lat2 - lat1) * Math.PI / 180
    const dLon = (lon2 - lon1) * Math.PI / 180

    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
            + Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180)
            * Math.sin(dLon / 2) * Math.sin(dLon / 2)
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    return R * c; // Returns distance in meters
  }

  showColdModal() {
    const coldModals = document.querySelectorAll("#modalCold")
    coldModals[this.currentIndex].classList.remove("d-none")
    coldModals[this.currentIndex].classList.add("modal-seen")
  }

  showWarmModal() {
    const warmModals = document.querySelectorAll("#modalWarm")
    warmModals[this.currentIndex].classList.remove("d-none")
    warmModals[this.currentIndex].classList.add("modal-seen")
  }

  showWarmerModal() {
    const warmerModals = document.querySelectorAll("#modalWarmer")
    warmerModals[this.currentIndex].classList.remove("d-none")
    warmerModals[this.currentIndex].classList.add("modal-seen")
  }

  hideModal() {
    const modals = document.querySelectorAll(".modal-seen")
    modals.forEach((modal) => {
      modal.classList.remove("modal-seen")
      modal.classList.add("d-none")
    });
  }

  showPoi() {
    const pois = document.querySelectorAll("#poi-modal")
    const poiButtons = document.querySelectorAll("#poi-button")
    poiButtons.forEach((button) => {
      button.addEventListener("click", (event) => {
        pois[this.currentIndex].classList.remove("d-none")
        this.hideModal()
      })
    })
  }

  continue() {
    const progress = document.getElementById("poi-progress")
    const currentProgress = parseInt(progress.textContent)
    const newProgress = currentProgress + 1
    const pois = document.querySelectorAll("#poi-modal");
    const closePoiButtons = document.querySelectorAll('#trip-poi')
    const markers = document.querySelectorAll('#poi-marker')
    closePoiButtons.forEach((button) => {
      button.addEventListener("click", (event) => {
        progress.outerHTML = `<p class="step-front" id='poi-progress' data-modal-target="progress">${newProgress}</p>`
        this.currentIndex += 1
        pois.forEach((poi) => {
          poi.classList.add("d-none")
        })
        markers[this.currentIndex].classList.remove('poi-marker')
        markers[this.currentIndex].classList.add('completed-poi')
        markers[this.currentIndex + 1].style.visibility = 'visible'
      })
    })
  }

  #addMarkersToMap(markers) {
    markers.forEach((marker) => {
      let poiMarker = document.createElement('div')
      poiMarker.className = 'poi-marker'
      poiMarker.idName = 'poi-marker'
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
