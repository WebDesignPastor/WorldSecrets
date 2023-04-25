import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    departureMarkers: Array
  }

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
      );

      // Add a marker for the user's location.
      this.marker = new mapboxgl.Marker({
        color: "#007bff",
      })
        .setLngLat([longitude, latitude])
        .addTo(this.map);

      // Add a departure marker.
      this.departureMarker = new mapboxgl.Marker({
      })
      .setLngLat([this.departureMarkersValue[0].lng, this.departureMarkersValue[0].lat])
      .addTo(this.map);
      this.departureMarker.className = 'poi-marker'

      // Add markers for pois.
      this.markersValue.forEach((marker, index) => {
        // let poiMarker = document.createElement('div')
        // poiMarker.className = 'poi-marker'
        // poiMarker.dataset.modalTarget = `poiMarker${index + 1}`
        new mapboxgl.Marker({
          color: "#007bff",
        })
          .setLngLat([marker.lng, marker.lat])
          .addTo(this.map);
      });

      // Move the map to follow the user's location.
      navigator.geolocation.watchPosition(position => {
        const { latitude, longitude } = position.coords;
        this.marker.setLngLat([longitude, latitude]);
        this.map.flyTo({
          center: [longitude, latitude],
          speed: 0.1,
          zoom: 16,
        });
      });
    });
  }
}
