// dropdown for temperature and emotion
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


// $(document).ready(function(){
//   $(".br-theme-fontawesome-fire").click(function(){
//     $("#temperature").submit();
//     });
// });

function changeEventHandler(event) {
  $(".fire-form").submit();
};

// JS to react when I select an option


