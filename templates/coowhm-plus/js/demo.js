jQuery(document).ready(function($) {
    $('.settingbutton').on('click', function() {
        if ($(this).hasClass('no_active')) {
            $(this).removeClass('no_active').addClass('active');
            $(".template-demo").animate({
                "right": "-250px"
            }, 100);
        } else {
            $(this).addClass('no_active');
            $(".template-demo").animate({
                "right": "0px"
            }, 100);
        }
    });

    $(".color-changer a").on("click", function(e) {
        if (!$(this).hasClass("disable")) {
            e.preventDefault();
            var color = $(this).attr("href");
            $(".color-changer a").removeClass("active");
            $(this).addClass("active");
        }
    });
	
	$(".menu-changer a").on("click", function(e) {
        if (!$(this).hasClass("disable")) {
            e.preventDefault();
            var color = $(this).attr("href");
            $(".menu-changer a").removeClass("active");
            $(this).addClass("active");
        }
    });

    $(".mods-changer a").on("click", function(e) {
        if ($(this).hasClass('active')) {
            $(this).removeClass("active");
        } else {
            $(this).addClass("active");
        }
    });

    $(".color-changer a.one").click(function() {
        $("body").removeClass('astrhost-version');
		$("body").removeClass('bredh-version');
		$(".btm.darkmodeatt").removeClass('d-none');
        if (!$(".stickyo").hasClass("active")) {
            $(".stickyo").addClass('active');
        }
    });

    $(".color-changer a.two").click(function() {
        $("body").removeClass('astrhost-version');
		$("body").removeClass('dark-mode');
		$("body").addClass('bredh-version');
		$(".btm.darkmodeatt").addClass('d-none');
		
        if ($(".stickyo").hasClass("active")) {
            $(".stickyo").removeClass('active');
        }
    });
	
	$(".color-changer a.tree").click(function() {
        $("body").removeClass('bredh-version');
		$("body").addClass('astrhost-version');
		$(".btm.darkmodeatt").removeClass('d-none');
		$("body").addClass('dark-mode');
        if ($(".stickyo").hasClass("active")) {
            $(".stickyo").removeClass('active');
        }
    });
	
	
	$(".menu-changer a.one").click(function() {
        $("body").removeClass('vertical-menu');
		$(".btm.sidebaro").removeClass('d-none');
    });
	
	$(".menu-changer a.two").click(function() {
        $("body").addClass('vertical-menu');
		$(".coodiv-navbar").addClass('navbar-collapsed');
		$(".btm.sidebaro").addClass('d-none');
    });
	

    $(".stickyo").click(function() {
        if ($(".stickyo").hasClass("active")) {
            $("body").addClass('body-sticky-header');
            $("body").removeClass('body-not-sticky-header');
        } else {
            $("body").removeClass('body-sticky-header');
            $("body").addClass('body-not-sticky-header');
        }
    });

    $(".sidebaro").click(function() {
        if (!$(".sidebaro").hasClass("active")) {
            $(".mobile-menu").removeClass('on');
            $(".coodiv-navbar").removeClass('navbar-collapsed');
        } else {
            $(".mobile-menu").addClass('on');
            $(".coodiv-navbar").addClass('navbar-collapsed');
        }
    });

    $(".mobile-menu").on("click", function(e) {
        if ($(this).hasClass("on")) {
            $(".sidebaro").addClass('active');
        } else {
            $(".sidebaro").removeClass('active');
        }
    });

    $(".navoff").click(function() {
        if (!$(".navoff").hasClass("active")) {
            $("body").removeClass('body-without-header');
        } else {
            $("body").addClass('body-without-header');
        }
    });

});