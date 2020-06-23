const tricks = $(".card-trick");
if (tricks.length > 8) {
  for (let i = 8; i < tricks.length; i++) {
    tricks[i].style.display = 'none';
  }
}
let tricksHidden = $(".card-trick:hidden");
const loadMoreTricks = document.getElementById('loadMoreTricks');
loadMoreTricks.addEventListener('click' , function() {
  for (let i = 0; i < 4 ; i++) {
    if (tricksHidden[i] != undefined) {
    tricksHidden[i].style.display = 'block';
    } else {
      loadMoreTricks.style.display = 'none';
    }
  }
  tricksHidden = $(".card-trick:hidden");
})