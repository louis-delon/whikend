const newTripForm = document.getElementById('new_trip');

if (newTripForm) {
  const department_selector = document.querySelector("#trip_hike");

  department_selector.addEventListener("change", function() {
    let current_department = department_selector.value;
    console.log(current_department);

    $.ajax({
      type: "GET",
      url: "hikes_by_department",
      dataType: "html",
      data: {department: current_department},
      success : insertHikes
    });
  });
}

const insertHikes = (code_html, statut) => {
  const hikesList = document.querySelector(".hikes__list");
  hikesList.innerHTML = code_html;
}
