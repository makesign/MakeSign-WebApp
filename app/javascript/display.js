document.addEventListener('turbo:load', function() {
    var carousel = document.querySelector('#carouselExampleInterval');
    if (carousel) {
      var carouselInstance = new bootstrap.Carousel(carousel);
    }
  });
  