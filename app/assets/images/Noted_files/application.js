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

	$(".link_note").hide()
	$('.thumbnail').on('click', function () {

			var id = $(this).data("id");
			var link = $(this).parent().parent().find(".link_note").children();
			$('iframe').attr('src', "http://www.youtube.com/embed/"+id);
			$('#start').html(link)
		});

 	$('#welcome_partial').hide();
	$('#welcome_reveal').on('click', function(){
		$('#welcome_partial').toggle();
	});
	


	$('#signup_form').hide()
	$('#sign_up').on('click', function() {
		$('#main_page').hide(0, function () {
			$('#signup_form').slideDown(300);
		});	
	})
	
	// $('#signin_form').hide()
	$('#sign_in').on('click', function() {
		$('#main_page').hide(0, function () {
			$('#signin_form').slideDown(300);
		});	
	})
	
	$(".close").on('click', function (event) {	
		$(event.target).closest('div').hide(0, function (){
			$('#main_page').slideDown(300);
		});
	});




});
