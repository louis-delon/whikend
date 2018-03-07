const hikesList = document.querySelector('.hikes__list');

function changeButton(target) {
  document.querySelectorAll('label.hike__radio').forEach((hike) => {
    hike.classList.remove('selected');
  });
  target.closest('.btn--primary').classList.add('selected');
}

if (hikesList) {
  hikesList.addEventListener('click', (event) => {
    if (event.target.classList.contains('hike__radio')) {
      changeButton(event.target);
    }
  });
}
