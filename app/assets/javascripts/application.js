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

	
	$('.video').hide();

	$(".dismiss").on('click', function (event) {	
		$(event.target).closest('p').slideUp()
	});


	//function update_player(data_id)

	// var id = $(this).data("id");

	$('.thumbnail').on('click', function () {
			var id = $(this).data("id");
			$('iframe').attr('src', "http://www.youtube.com/embed/"+id);
		});

	
	
	// $('.thumbnail').on('click', function () {
	// 		$('#video_player').val($(this).data("id"));
	// 	});




});
