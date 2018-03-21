import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.css";

const tripDate = document.getElementById('trip_date');
if (tripDate) {
  new flatpickr(tripDate, { dateFormat: 'd-m-Y'});
}

const searchDate = document.querySelector('.banner--home__search #date');
if (searchDate) {
  new flatpickr(searchDate, { dateFormat: 'd-m-Y'});
}
