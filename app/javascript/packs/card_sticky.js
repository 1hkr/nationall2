function triggerCardSticky() {
  // When the user scrolls the page, execute myFunction
  window.onscroll = function() {myFunction()};


}

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  // Get the article's card
  var card_article = document.getElementsByClassName('card-article')[0];
  var card_banner = document.getElementsByClassName('article-banner')[0];
  var card_author_container = document.getElementsByClassName('card-author-container')[0];

  // Get the offset position of the bottom of the article
  var sticky = card_banner.offsetTop + card_banner.offsetHeight + card_article.offsetHeight - 30;

  // Get the author's card

  // Get the offset position of the bottom of the author's card
  var card_author = document.getElementsByClassName('card-author')[0];
  var height = card_author.offsetHeight;
  var initial = card_author.offsetTop;

  if ((window.pageYOffset + height) >= sticky) {
    card_author_container.style.position = "relative";
    card_author.style.position = "absolute";
    card_author.style.top = (sticky - card_banner.offsetHeight - height - 60)+"px";
    card_author.classList.remove("sticky");
  } else {
   card_author_container.style.position = "sticky";
   card_author.style.position = "";
   card_author.classList.add("sticky");
 }
}

export { triggerCardSticky };
