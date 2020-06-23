

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

