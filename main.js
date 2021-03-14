function openCity(cityName) { 
  //function that has one parameter, cityName
  var i;
  var x = document.getElementsByClassName("city");
  //puts all elements with the class 'city' into an array. There are three in total: the divs for London, Paris and Tokyo
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  document.getElementById(cityName).style.display = "block";  
   //while i (which starts at 0) is less than the length of the array x (which has a length of 3 as has three items (the div elements) in total in it) add 1 onto i.
  //then x[i] means to start with x[0], which is the first element in the array, which is the first div with class name 'city', which is London.
  //Then set the display of that div element to none (i.e. hide it)
  //then the loop goes back to the start as 0 is still less than x.length (which is 2). So it adds on 1 to i to make it 1. 
  //Then on the next line of the loop x[i] is now x[1], i.e. the second item in the array which is the div for Paris. So it now sets that to display none as well, and does the same for the third element of the array (whilst i is = to 2 at that point and then i is not less than x.length after that point so the loop stops.)
  //At this point all the divs with classname city are set to display none; but now we want to set one of them only to display block. 
  //On the final line of the function, one of the divs is set to display block. That div is selected by whichever button was chosen as each one runs the function openCity and passes to it one of the cities as the argument.
  //So if you click on the 'London' button, the click triggers the openCity function and passes 'London' as the argument. And then the getElementById picks up the ID London because, I think, the argument given and the ID of that div are the same. I think that's everything...
}

//  Tabs with jquery
$(document).ready(function(){
  $("#LondonB").click(function(){
    $(".description").hide();
    $("#LondonP").slideToggle(0); // Note can change value of slide toggle to e.g. "fast" to create an animated appearance of it
    $(".tab-button").fadeTo("fast", 1);
    $("#LondonB").fadeTo(1, 0.6);
  });
  $("#ParisB").click(function(){
    $(".description").hide();
    $("#ParisP").slideToggle(0);
    $(".tab-button").fadeTo("fast", 1);
    $("#ParisB").fadeTo(1, 0.6);
  });
  $("#TokyoB").click(function(){
    $(".description").hide();
    $("#TokyoP").slideToggle(0);
    $(".tab-button").fadeTo("fast", 1);
    $("#TokyoB").fadeTo(1, 0.6);
  });
});

// CAROUSEL/SLIDESHOW FUNCTIONS
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

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

