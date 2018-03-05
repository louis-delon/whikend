// const hikeCard = document.querySelector(".hike__card");
//
// if (hikeCard) {
//   const hikeCardCheckbox = document.querySelector(".hike__radio");
//   $(document).on("click", "hikeCardCheckbox", function(selectCard) {
//   });
// }

const hikesList = document.querySelector('.hikes__list');

function changeButton() {
  const button; = document.querySelector('label.hike__radio');
  button.classList.add('selected');
  button.innerText = "Hike selected";
  // Checker toutes les cards
  // Remove classe selected de toutes
  // Ajout classe selected uniquement sur card cliquée
}

if (hikesList) {
  hikesList.addEventListener('click', (event) => {
    if (event.target.classList.contains('hike__radio')) {
      console.log('cc');
      changeButton();
    }
  });
}
