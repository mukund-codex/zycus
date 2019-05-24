	$(window).scroll(function(){
		 var scrollTop = $(window).scrollTop();
		  if ( scrollTop > 50) { 
		    $('.header').addClass('fixed');
		  }else{
		  	$('.header').removeClass('fixed');
		  }

		  if ($(this).scrollTop() > 100) {
	            $('.scrollToTop').fadeIn();
	      } else {
	            $('.scrollToTop').fadeOut();
	      }
	});

	$( document ).ready(function() {
	    var s1 = $('#div1').height();
	    var s2 = $('#div2').height();

	    if (s1 > s2)
	        $('#div2').css('height', s1 + "px");
	    else
	        $('#div1').css('height', s2 + "px");


	    $('.scrollToTop').click(function(){
	        $('html, body').animate({scrollTop : 0},800);
	        return false;
	    });
	});
	
// mobile Side menu
$(document).ready(function(){

  $(".navbar-toggle").click(function(){
    $("#close").toggleClass("nav-open");
  });
   $(".navbar-toggle").click(function(){
    $("#bars").toggleClass("bar-hidden");
  });

    });
	
// mobile Category menu
$(document).ready(function(){

  $(".mob-cat-btn").click(function(){
    $("#ihide").toggleClass("nav-open");
  });
   $(".mob-cat-btn").click(function(){
    $("#ishow").toggleClass("bar-hidden");
  });
   $(".mob-cat-btn").click(function(){
    $(".category").toggleClass("nav-hidden");
  });
    });
	
// dropdown arrow
$(document).ready(function(){

  $(".sb-nav").click(function(){
    $("#sbnav-open").toggleClass("sbnav-open");
  });
   $(".sb-nav").click(function(){
    $("#sbnav-close").toggleClass("sbnav-close");
  });
    });