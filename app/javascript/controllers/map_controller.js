import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static targets = ["mapElement", "sidebar", "sidebarContent", "closeButton"]
  static values = {
    apiKey: String,
    markers: Array,
    userMarker: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.mapElementTarget, // Changé ici, on cible avec le target
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.closeButtonTarget.addEventListener('click', () => {
      this.closeSidebar()
    })
    this.map.on('load', () => {
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
      this.#addUserMarkersToMap()
    })
  }
  closeSidebar() {
    this.sidebarTarget.classList.remove('active')
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      customMarker.style.cursor = 'pointer'
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
      customMarker.addEventListener('click', (e) => {
        this.#toggleSideBar(marker)
      })
    })
  }
  #toggleSideBar(marker) {
    this.sidebarContentTarget.innerHTML = marker.info_window_html
    // if (this.sidebarTarget.classList.contains('active')) {
    //   this.closeSidebar()
    // } else {
    //   this.sidebarTarget.classList.add('active')
    // }
    this.sidebarTarget.classList.add('active')
  }
  #addUserMarkersToMap() {
    this.userMarkerValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.userMarkerValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 })
  }
}
