// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
require("mapbox-gl");

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

if (document.getElementById('map') !== null ) {
  document.addEventListener('turbolinks:load', () => {    
    callMapAPI(address);
  });
}

const mapApi = (xAxis, yAxis) => {
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [xAxis, yAxis],
    zoom: 15
  });
  new mapboxgl.Marker()
  .setLngLat([xAxis, yAxis])
  .addTo(map);
};

const callMapAPI = (address) => {
  const mapBoxAccessToken = "pk.eyJ1IjoicHhjcm9uaW4iLCJhIjoiY2tnd2d0dThpMDJqbTJ6cmdra2Rqbmw4byJ9.UzNokaYnFf1IM89qnyFNxQ";
  const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${mapBoxAccessToken}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      const xAxis = data.features[0].center[0];
      const yAxis = data.features[0].center[1];
      mapApi(xAxis, yAxis);
    });
};
