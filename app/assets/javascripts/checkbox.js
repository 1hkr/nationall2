$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
    // let inputOne = document.querySelectorAll('.emotion-choices')[0].getElementsByTagName("input")[0]
    // let inputTwo = document.querySelectorAll('.emotion-choices')[0].getElementsByTagName("input")[1]
    // if (this.id === "choice-1") {
    //   inputOne.setAttribute('checked', 'checked')
    //   inputTwo.removeAttribute('checked')
    //   console.log(inputOne)
    //   console.log(inputTwo)
    // } else {
    //   inputTwo.setAttribute('checked', 'checked')
    //   inputOne.removeAttribute('checked')
    //   console.log(inputOne)
    //   console.log(inputTwo)
    // }
    });
  //   $('#submit').click(function(){
  //     console.log(this)
  //     $('.form-hide').hide();
  // });
});

$(document).ready(function(){
  $(".tempe-choice").click(function(){
    $(this).toggleClass("ready");
  });
});

$("#new_categories_pref").submit(function(event){
  document.getElementById("new_categories_pref_wrapper").classList.add("hidden")
  document.getElementById("edit_user_2_wrapper").classList.remove("hidden")
});

$("#edit_user_2").submit(function(event){
  document.getElementById("edit_user_2_wrapper").classList.add("hidden")
  document.getElementById("temperature-form").classList.remove("hidden")
});


