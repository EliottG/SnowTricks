

// Confirmation de suppression de Trick 
const confirmDelete = document.getElementsByClassName("delete");
for (let i = 0; i < confirmDelete.length; i++) {
  confirmDelete[i].addEventListener('click', function (event) {
    if (!confirm('Vous êtes sur le point de supprimer un Trick.')) {
      event.preventDefault();
    }
  });
}
// Afficher l'ajout d'une image dans le formulaire
$('.custom-file-input').on('change', function (event) {
  let inputFile = event.currentTarget;
  let label = inputFile.files.length;
  $(inputFile).parent()
    .find('.custom-file-label')
    .html(label);
});
// Bouton afficher les médias pour le téléphone
const medias = document.getElementsByClassName("carousel");
const buttonMedia = document.getElementById("button-media");
function showMedia() {
  for (let i = 0; i < medias.length; i++) {
    if (medias[i].style.display === 'block') {
      medias[i].style.display = 'none';
      buttonMedia.innerHTML = 'Afficher les médias';
    } else {
      medias[i].style.display = 'block';
      buttonMedia.innerHTML = 'Masquer les médias';
    }
  }
}
// Afficher plus (trick accueil)
const tricks = document.getElementsByClassName("card-trick");
const loadMoreButton = document.getElementById('buttonLoadMore');
let visibleTricks = 8
if (tricks.length > visibleTricks) {
  for (let i = 8; i < tricks.length; i++) {
    tricks[i].style.display = 'none';
  }
}
function loadMore() {
  for (let i = 0; i < 4; i++) {
    if (tricks[visibleTricks + i] != undefined) {
    tricks[visibleTricks + i].style.display = 'block'
    } else {
      loadMoreButton.style.display = 'none';
    }
  }
  visibleTricks = visibleTricks + 4;

}
// Afficher plus (commentaire)
const comments = document.getElementsByClassName('comment');
const buttonLoadMore = document.getElementById('loadMoreComments')
let visibleComments = 4;
if (comments.length <= visibleComments) {
  buttonLoadMore.style.display = 'none';
} else {
  for (let i = 4; i < comments.length; i++) {
    comments[i].style.display = 'none';
  }
}
function loadComments() {
  for (let i = 0; i < 4; i++) {
    if (comments[visibleComments + i] != undefined) {
      comments[visibleComments + i].style.display = '';
    } else {
      buttonLoadMore.style.display = 'none';
    }
  }
  visibleComments = visibleComments + 4;
}




