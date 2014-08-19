// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require turbolinks
//= require_tree .

//= require best_in_place

$(document).on('ready page:load', function () {

	// $(document).on('ajax:success', '.nav', function(e){
	// 	$(e.currentTarget).closest('.card').fadeOut();
	// })

	

	$(".dismiss").on('click', function (event) {
		$(event.target).closest('p').slideUp()
	});


	var width = 711;
	var animationSpeed = 1000;
	var pause = 3000;
	var currentSlide = 1;

	var $slider = $('#slider');
	var $sliderContainer = $slider.find('.slides');
	var $slides = $sliderContainer.find('.slide');

	var interval;

	function startSlider() {
		interval = setInterval(function() {
			$sliderContainer.animate({'margin-left': '-='+width}, animationSpeed, function(){
				currentSlide++;
				if(currentSlide === $slides.length) {
					currenSlide = 1;
					$sliderContainer.css('margin-left', 0);
				}
			});
		}, pause);

	}

	function stopSlider(){
		clearInterval(interval);
	}

	$slider.on('mouseenter', stopSlider).on('mouseleave', startSlider);

	// startSlider();



});
