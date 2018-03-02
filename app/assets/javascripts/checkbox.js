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

$("#categories-form").submit(function(event){
  console.log("hello")
  event.target.classList.add("hidden");
  document.getElementById("emotion-form").classList.remove("hidden")
});

$("#emotion-form").submit(function(event){
  console.log("hello")
  event.target.classList.add("hidden");
  document.getElementById("temperature-form").classList.remove("hidden")
});


