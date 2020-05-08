document.addEventListener("DOMContentLoaded", function() {
  const inpFile = document.getElementById("post_image");
  const previewImage = document.getElementById("previewImage");
  
  inpFile.addEventListener('change', function() {
    const file = this.files[0]

    if (file) {
      const reader = new FileReader()

      previewImage.style.display = "block";

      reader.addEventListener('load', function() {
        previewImage.setAttribute('src', this.result)
      })

      reader.readAsDataURL(file)
    } else {
      previewImage.style.display = null;
    }
  })

  const filterSelect = document.getElementById('post_filter')

  filterSelect.addEventListener('change', function(e) {
    let selection = e.target.value;
    let filterClass = `filter_${selection.toLowerCase()}`;
    previewImage.setAttribute('class', filterClass)
  })
});