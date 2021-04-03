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

function hamburger(x) {
  x.classList.toggle("hamburger-to-x");
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
  // MOBILE HEADER TOGGLE
  $(".hamburger").click(function() {
    $(".header-nav").slideToggle(400);
  });
  $(".drop-trigger").click(function() {
    // var clicks = $(this).data('clicks');
    // if (clicks) {
    //   $(".drop-menu").css("display", "none");
    // }
    // else {
    //   $(".drop-menu").css("display", "block");
    // }
    // $(this).data("clicks", !clicks);
    $(this).next().slideToggle(400);
  });

    

  // DISABLED BELOW FOR NOW AS MAKING THINGS TOO COMPLICATED WITH MOBILE HEADER
  // // Hide Header on on scroll down
  // if ($(window).width() < 800) {
  //   // Above line so only runs on smaller devices.

  //   var didScroll;
  //   var lastScrollTop = 0;
  //   var delta = 50;
  //   var navbarHeight = $('header').outerHeight();

  //   $(window).scroll(function(event){
  //       didScroll = true;
  //   });               

  //   setInterval(function() {
  //       if (didScroll) {
  //           hasScrolled();
  //           didScroll = false;
  //       }
  //   }, 250);

  //   function hasScrolled() {
  //     var st = $(this).scrollTop();
      
  //     // Make sure they scroll more than delta
  //     if(Math.abs(lastScrollTop - st) <= delta)
  //         return;
      
  //     // If they scrolled down and are past the header, add class .header.
  //     // This is necessary so you never see what is "behind" the header.
  //     if (st > lastScrollTop && st > navbarHeight){
  //         // Scroll Down
  //         $('header').removeClass('header').addClass('hide');
  //     } else {
  //         // Scroll Up
  //         if(st + $(window).height() < $(document).height()) {
  //             $('header').removeClass('hide').addClass('header');
  //         }
  //     }
      
  //     lastScrollTop = st;
  //   }
  // }
 
 
  // //This ONE WORKS BUT NOT RIGHT
  // var header = $(".header");
  // $(window).scroll(function() {
  //     var scroll = $(window).scrollTop();

  //     if (scroll >= 500) {
  //         header.removeClass('header').addClass("hide");
  //     } else {
  //         header.removeClass("hide").addClass('header');
  //     }
  // });
});



// FUNCTION FOR IMAGE FADE IN
function showImages(el) {
  var windowHeight = jQuery( window ).height();
  $(el).each(function(){
      var thisPos = $(this).offset().top;

      var topOfWindow = $(window).scrollTop();
      if (topOfWindow + windowHeight - 200 > thisPos ) {
          $(this).addClass("fadeIn");
      }
  });
}
// if the image in the window of browser when the page is loaded, show that image
$(document).ready(function(){
  showImages('.fade-image');
});

// if the image in the window of browser when scrolling the page, show that image
$(window).scroll(function() {
  showImages('.fade-image');
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


// ************SORTABLE TABLE SCRIPT
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;

  //   I added the below line of code so that the table variable is always the actual table clicked on. The parentElement appendages go up the DOM until it hits the <table> element (from <th> on event.target, to <tr>, to <thead> (added by browser even if I don't include it), to <table>. 'event.target' starts at the element that caused the event (the one clicked on), in this case one of the th elements. This means that I only need one bit of code for all tables set up this way. 
  table = event.target.parentElement.parentElement.parentElement;
  
  switching = true;
  //Set the sorting direction to ascending:
  dir = "asc"; 
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /*check if the two rows should switch place,
      based on the direction, asc or desc:*/
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch= true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          //if so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      //Each time a switch is done, increase this count by 1:
      switchcount ++;      
    } else {
      /*If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again.*/
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}





