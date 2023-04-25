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

      // Move the map to follow the user's location.
      navigator.geolocation.watchPosition(position => {
        const { latitude, longitude } = position.coords;
        this.marker.setLngLat([longitude, latitude]);
        this.map.flyTo({
          center: [longitude, latitude],
          speed: 0.5,
          zoom: 16,
        });
      });
    });
  }
}
