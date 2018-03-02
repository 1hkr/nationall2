
// function hoverVideo(e) {
//     $('video', this).get(0).play();
// }

function hideVideo(e) {
    e.target.pause();
}

function playVideo(e) {
  console.log("hello")
    e.target.play();
}

var videoplay = $(".videoplay");

// console.log(videoplay)

// var playPromise = videoplay.play();




var figure = videoplay.hover( playVideo, hideVideo );

// if (playPromise !== undefined) {
//   playPromise.then(_ => {
//     // Automatic playback started!
//     // Show playing UI.
//   })
//   .catch(error => {
//     // Auto-play was prevented
//     // Show paused UI.
//   });
// }


