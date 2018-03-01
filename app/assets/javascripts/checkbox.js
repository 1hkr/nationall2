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
});
