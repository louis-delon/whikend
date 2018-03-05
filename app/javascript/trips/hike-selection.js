const selectCard = function(event) {
  console.log("coucou");
}

const hikeCard = document.querySelector(".hike__card");

if (hikeCard) {
  const hikeCardCheckbox = document.querySelector(".hike__radio");
  hikeCardCheckbox.onclick(selectCard);
}
