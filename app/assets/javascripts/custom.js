var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}


$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}
//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  $.fn.SimpleModal({
    model: "modal",
    title: "Please confirm",
    contents: message
  }).addButton("Confirm", "button alert", function(){
    $.rails.confirmed(link);
    this.hideModal();
  }).addButton("Cancel", "button secondary").showModal();
}
// var slideIndex = 0;
// showSlides();
//
// function showSlides() {
//   var i;
//   var slides = document.getElementsByClassName("mySlides");
//   for (i = 0; i < slides.length; i++) {
//     slides[i].style.display = "none";
//   }
//   slideIndex++;
//   if (slideIndex > slides.length) {slideIndex = 1}
//   slides[slideIndex-1].style.display = "block";
//   setTimeout(showSlides, 10000); // Change image every 10 seconds
// }

function myFunction(x) {
  x.classList.toggle("change");
}

// on hover to change pictures in collection#index
(document).on "page:change", ->{
// (document).ready(function() {
  (".collection-artwork-card-image-closed-box").mouseenter(function() {
      (".collection-artwork-card-image-open-box").show();
      (".collection-artwork-card-image-closed-box").hide();
      (this).hide();
  });

  (".collection-artwork-card-image-open-box").mouseout(function() {
    (".collection-artwork-card-image-closed-box").show();
    (".collection-artwork-card-image-open-box").hide();
    (this).hide();
  });
// });
};
