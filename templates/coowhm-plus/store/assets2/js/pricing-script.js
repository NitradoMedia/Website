"use strict";

/* Pricing slider js */
var owlPackage = $('.package_slider');
owlPackage.owlCarousel({
    margin:0,
    loop: true,
    dots:false,
    nav:true,
    center:true,
    smartSpeed: 1000,
    autoplay:false,
    items:3,
    responsive: {
		0: {
			items: 1,
			margin:15,
			dots:true,
			nav:true
		},
		481: {
			items: 2,
			dots:true,
			nav:true
		},
		768: {
			items: 2,
			dots:true,
			nav:true
		},
		992: {
			items: 3,
			dots:true,
			nav:true
		},
		1200: {
			items: 3,
			dots:true,
			nav:true
		},
		1367: {
			items: 4,
			dots:true,
			nav:true
		}
	}
});

// color picker start
    (function() {
        $('<div class="color-picker">' +
		'<a href="#" class="handle">' +
		'<img class="setting-icon" src="assets2/img/settings.png" alt="setting icon">' +
		'</a><div class="sec-position"><div class="settings-header">' +
		'<h3>Select Color</h3>' +
		'</div>' +
		'<div class="section">' +
		'<div class="colors o-auto">' +
		'<a href="#" class="color-1" ></a>' +
		'<a href="#" class="color-2" ></a>' +
		'<a href="#" class="color-3" ></a>' +
		'<a href="#" class="color-4" ></a>' +
		'<a href="#" class="color-5" ></a>' +
		'<a href="#" class="color-6" ></a>' +
		'</div>' +
		'</div>' +
		'<div class="settings-header"><h3>Designs</h3></div>' +
		'<div class="section">' +
		'<a href="#" class="setting-link setting-link-1">Background - 1</a>' +
		'<a href="#" class="setting-link setting-link-2">Background - 2</a>' +
		'<a href="#" class="setting-link setting-link-3">Background - 3</a>' +
		'<a href="#" class="setting-link setting-link-4">Background - 4</a>' +
		'<a href="#" class="setting-link setting-link-5">Rounded</a>' +
		'<a href="#" class="setting-link setting-link-6">Rectangle</a>' +
		'</div>' +
		'</div>' +
		'</div>').appendTo($('body'));
	})();
    var body_event_colorpicker = $("body");
    body_event_colorpicker.on("click", ".color-1", function() {
        $("#color" ).attr("href", "assets2/css/color-1.css" );
        return false;
		
	});
    body_event_colorpicker.on("click", ".color-2", function() {
        $("#color" ).attr("href", "assets2/css/color-2.css" );
        return false;
	});
    body_event_colorpicker.on("click", ".color-3", function() {
        $("#color" ).attr("href", "assets2/css/color-3.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".color-4", function() {
        $("#color" ).attr("href", "assets2/css/color-4.css" );
        return false;
	});
    body_event_colorpicker.on("click", ".color-5", function() {
        $("#color" ).attr("href", "assets2/css/color-5.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".color-6", function() {
        $("#color" ).attr("href", "assets2/css/color-6.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".setting-link-1", function() {
		$("#plan-background" ).attr("href", "assets2/css/background-1.css" );
		return false;
	});
	body_event_colorpicker.on("click", ".setting-link-2", function() {
		$("#plan-background" ).attr("href", "assets2/css/background-2.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".setting-link-3", function() {
		$("#plan-background" ).attr("href", "assets2/css/background-3.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".setting-link-4", function() {
		$("#plan-background" ).attr("href", "assets2/css/background-4.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".setting-link-5", function() {
		$("#plan-shape" ).attr("href", "assets2/css/shape-1.css" );
        return false;
	});
	body_event_colorpicker.on("click", ".setting-link-6", function() {
		$("#plan-shape" ).attr("href", "assets2/css/shape-2.css" );
        return false;
	});
    $('.color-picker').animate({right: '-190px'});
    body_event_colorpicker.on("click", ".color-picker a.handle", function(e) {
        e.preventDefault();
        var div = $('.color-picker');
        if (div.css('right') === '-190px') {
            $('.color-picker').animate({right: '0px'});
		}
        else {
            $('.color-picker').animate({right: '-190px'});
		}
	});
	// color picker end
