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

      // Add a departure marker.
      this.departureMarker = new mapboxgl.Marker({
        color: "#007bff",
      })
      .setLngLat([this.departureMarkersValue[0].lng, this.departureMarkersValue[0].lat])
      .addTo(this.map);

      // Add a marker for the user's location.
      this.marker = new mapboxgl.Marker({
        color: "#007bff",
      })
        .setLngLat([longitude, latitude])
        .addTo(this.map);

      // Add markers for pois
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

        // Check if the user is within 20 meters of any marker in this.markersValue
        const firstMarker = this.markersValue[0];
        const distance = this.distance(latitude, longitude, firstMarker.lat, firstMarker.lng);
        const firstModalCold = document.querySelector("#first-modal-cold");
        const firstModalWarm = document.querySelector("#first-modal-warm");
        const firstModalWarmer = document.querySelector("#first-modal-warmer");

        if (distance <= 5) {
          firstModalWarmer.classList.remove("d-none");
          firstModalCold.classList.add("d-none");
          firstModalWarm.classList.add("d-none");
        } else if (distance <= 20) {
          firstModalWarm.classList.remove("d-none");
          firstModalCold.classList.add("d-none");
          firstModalWarmer.classList.add("d-none");
        } else if (distance <= 50) {
          firstModalCold.classList.remove("d-none");
          firstModalWarm.classList.add("d-none");
          firstModalWarmer.classList.add("d-none");
        }
      });
    });
  }

  distance(lat1, lon1, lat2, lon2) {
    const R = 6371e3; // Earth's radius in meters
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;

    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
            + Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180)
            * Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

    return R * c; // Returns distance in meters
  }

  showFirstPoi() {
    const firstModalWarmer = document.querySelector("#first-modal-warmer");
    const pois = document.querySelector.all("poi");
    firstModalWarmer.classList.add("d-none");
    pois[0].classList.remove("d-none");
  }

  hidePoi() {
    const pois = document.querySelector.all("#poi");
    pois.forEach(poi => {
      poi.classList.add("d-none");
    });
  }
}
