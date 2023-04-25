import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="real-trip"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log("banane");

    mapboxgl.accessToken = this.apiKeyValue;

    navigator.geolocation.watchPosition(position => {
      const { latitude, longitude } = position.coords;
      // Show a map centered at latitude / longitude.
      this.map = new mapboxgl.Map({
        container: this.element,
        zoom: 16, // set the initial zoom level
        center: [longitude, latitude],
        style: "mapbox://styles/fanchpastor/cleztoc72003801o3sccvya6t",
      });

      // Add geolocate control to the map.
      // this.map.addControl(
        //   new mapboxgl.GeolocateControl({
          //     positionOptions: {
            //       enableHighAccuracy: true,
            //     },
            //     // When active the map will receive updates to the device's location as it changes.
      //     trackUserLocation: true,
      //     // Draw an arrow next to the location dot to indicate which direction the device is heading.
      //     showUserHeading: true,
      //   })
      // );

      // Create a marker at the current location and add it to the map.
      new mapboxgl.Marker({
        color: "#007bff", // set the marker color
      })
        .setLngLat([longitude, latitude])
        .addTo(this.map);

      // Zoom the map to the current location.
      // this.map.flyTo({
      //   center: [longitude, latitude],
      //   zoom: 16, // set the zoom level
      //   essential: true,
      // });
    });
  }

}
