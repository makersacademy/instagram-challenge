document.addEventListener("DOMContentLoaded", function() {
  const inpFile = document.getElementById("post_image");
  const container = document.getElementById("image-preview-container");
  const image = document.getElementById("previewImage")
  
  try {
    inpFile.addEventListener('change', function() {
      const file = this.files[0]
  
      if (file) {
        const reader = new FileReader()
  
        container.style.display = "block";
  
        reader.addEventListener('load', function() {
          image.setAttribute('src', this.result)
        })
  
        reader.readAsDataURL(file)
      } else {
        container.style.display = null;
      }
    })
  } catch (error) {
    
  }

  const filterSelect = document.getElementById('post_filter')

  filterSelect.addEventListener('change', function(e) {
    let selection = e.target.value;
    let filterClass = `filter_${selection.toLowerCase()}`;
    image.setAttribute('class', filterClass)
  })
});