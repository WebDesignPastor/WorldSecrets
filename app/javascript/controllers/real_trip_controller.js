import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
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
      this.geolocate = new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true,
        },
        trackUserLocation: true,
        showUserHeading: true,
      });
      this.map.addControl(this.geolocate);

      // Add a marker for the user's location.
      this.marker = new mapboxgl.Marker({
        color: "#007bff",
      })
        .setLngLat([longitude, latitude])
        .addTo(this.map);

      // Move the map to follow the user's location.
      this.geolocate.on("geolocate", e => {
        const { latitude, longitude } = e.coords;
        this.marker.setLngLat([longitude, latitude]);
        this.map.flyTo({
          center: [longitude, latitude],
          zoom: 16,
        });
      });
    });
  }
}
