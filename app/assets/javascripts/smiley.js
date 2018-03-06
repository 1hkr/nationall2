$(document).ready(function(){
  $(".smiley").click(function(){
    document.querySelectorAll(".smiley").forEach((item)=>{
      item.classList.remove("active")
    });
    $(this).toggleClass("active");
    });
});
