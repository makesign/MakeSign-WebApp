//Change the text inside the image upload button of slides to the name of the file
//turbo:load for loading the Javascript every time

document.addEventListener('turbo:load', function() {
    const fileInput = document.getElementById('uploadImage');
    const label = document.getElementById('image-label');
    
    fileInput.addEventListener('change', function() {
      if (fileInput.files.length > 0) {
        label.textContent = fileInput.files[0].name;
      }
    });
  });
  