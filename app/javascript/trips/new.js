console.log("hey!!");

const newTripForm         = document.getElementById('new_trip');
const department_selector = $( "#trip_hike" );

const changeDepartement = function(event) {
  let current_department = event.val;
  $.ajax({
    type: "GET",
    url: "hikes_by_department",
    dataType: "html",
    data: {department: current_department},
    success : insertHikes
  });
}

const insertHikes = (code_html, statut) => {
  const hikesList = document.querySelector(".hikes__list");
  hikesList.innerHTML = code_html;
}

if (newTripForm) {
  department_selector.select2();
  department_selector.on("change", changeDepartement);
}
