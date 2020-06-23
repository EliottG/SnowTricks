const comments = $(".comment")
const loadMoreComments = document.getElementById('loadMoreComments')
if (comments.length <= 10) {
  loadMoreComments.style.display = 'none';
} else {
  for (let i = 10; i < comments.length; i++) {
    comments[i].style.display = 'none';
  }
}
let hiddenComments = $(".comment:hidden")
loadMoreComments.addEventListener("click", function(){
  for (let i = 0; i < 10; i++) {
    if (hiddenComments[i] != undefined) {
      hiddenComments[i].style.display = '';
    } else {
      loadMoreComments.style.display = 'none';
    }
  }
  hiddenComments = $(".comment:hidden")
})




