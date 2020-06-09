

// Confirmation de suppression de Trick 
const confirmDelete = document.getElementsByClassName("delete");
for(let i = 0; i<confirmDelete.length; i++) {
confirmDelete[i].addEventListener('click', function(event) {
  if (!confirm('Vous êtes sur le point de supprimer un Trick.')) {
    event.preventDefault();
  }
    });
}

$('.custom-file-input').on('change', function (event) {
  let inputFile = event.currentTarget;

  // TODO concatener les noms des fichiers
  let label = inputFile.files.length;
  $(inputFile).parent()
      .find('.custom-file-label')
      .html(label);
});


