
var playersrc = document.getElementById('player').src

playersrc.hover ( playVideo, pauseVideo );

function playVideo(e) {
  this.get(0).play();
}

function pauseVideo(e) {
  this.get(0).pause();
}
