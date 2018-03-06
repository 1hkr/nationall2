// JS to react when I select an option
$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
    });
  $(".emotion-choice").click(function(){
    document.querySelectorAll(".emotion-choice").forEach((item)=>{
      item.classList.remove("active")
    });
    $(this).toggleClass("active");
    });

  $(".tempe-choice").click(function(){
    document.querySelectorAll(".tempe-choice").forEach((item)=>{
      item.classList.remove("active")
    });
    $(this).toggleClass("active");
    });
});

// JS to react when I select an option

$("#new_categories_pref").submit(function(event){
  document.getElementById("new_categories_pref_wrapper").classList.add("hidden")
  document.getElementById("edit_user_wrapper").classList.remove("hidden")
});

var user_id = $("#edit_user_wrapper").data('user')

$("#edit_user_" + user_id).submit(function(event){
  document.getElementById("edit_user_wrapper").classList.add("hidden")
  document.getElementById("temperature-form").classList.remove("hidden")
});


