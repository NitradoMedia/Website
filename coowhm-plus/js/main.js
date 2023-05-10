"use strict";
/* side menu functions  */
function menuhrres() {
    $(window)[0].innerWidth < 768 ? setTimeout(function() {
        $(".sidenav-horizontal-wrapper")
            .addClass("sidenav-horizontal-wrapper-dis")
            .removeClass("sidenav-horizontal-wrapper"),
            $(".theme-horizontal").
        addClass("theme-horizontal-dis")
            .removeClass("theme-horizontal")
    }, 400) : setTimeout(function() {
        $(".sidenav-horizontal-wrapper-dis").addClass("sidenav-horizontal-wrapper").removeClass("sidenav-horizontal-wrapper-dis"), $(".theme-horizontal-dis").addClass("theme-horizontal").removeClass("theme-horizontal-dis")
    }, 400)
}



$(window).load(function() {
$('#loading-bg').delay(200).fadeOut('slow');
}());


/* toggle menu functions  */
function togglemenu() {
    var e = $(window)[0].innerWidth;
    0 == $(".coodiv-navbar").hasClass("theme-horizontal") && (e <= 1200 && e >= 992 && $(".coodiv-navbar").addClass("navbar-collapsed"),
        e < 992 && $(".coodiv-navbar").removeClass("navbar-collapsed")), (e <= 1200 && e >= 992 && $("section#footer").addClass("footer-collapsed"),
        e < 992 && $("section#footer").removeClass("footer-collapsed"))
}

$(document).ready(function() {
        function e(e) {
            13 == e.which && s(e)
        }

        togglemenu(), menuhrres();
        var o = $(window)[0].innerWidth;
        if ($('[data-toggle="tooltip"]').tooltip(),
            $(".mobile-menu").on("click", function() {
                $(this).toggleClass("on")
            }),

            $("#mobile-collapse").on("click", function() {
                $(".coodiv-navbar").toggleClass("navbar-collapsed")
                $("section#footer").toggleClass("footer-collapsed")
            }),

            $(".search-btn").on("click", function() {
                $(this);
                $(".main-search").addClass("open"), $(".main-search .form-control").css({
                    width: "90px"
                })
            }),

            $(".search-close").on("click", function() {
                $(this);
                $(".main-search").removeClass("open"), $(".main-search .form-control").css({
                    width: "0"
                })
            }),

            $("#m-search").on("keyup", function() {
                var e = $(this).val().toLowerCase(),
                    s = $(this).val().length;
                $(".coodiv-inner-navbar > li").each(function() {
                    var d = $(this).attr("data-username");
                    if (d) var i = d.toLowerCase();
                    if (i) {
                        -1 !== i.indexOf(e) ? $(this).show() : $(this).hide(), s > 0 ? $(".coodiv-menu-caption").hide() : $(".coodiv-menu-caption").show()
                    }
                })
            }),

            !$(".coodiv-navbar").hasClass("theme-horizontal")
        ) {
            var o = $(window)[0].innerWidth;
            o < 992 || $(".coodiv-navbar").hasClass("menupos-static") ? $(".navbar-content").slimScroll({
                setTop: "1px",
                size: "5px",
                wheelStep: 10,
                touchScrollStep: 90,
                alwaysVisible: !1,
                allowPageScroll: !0,
                color: "rgba(0,0,0,0.5)",
                height: "calc(100% - 70px)",
                width: "100%"
            }) : $(".navbar-content").slimScroll({
                setTop: "1px",
                size: "5px",
                wheelStep: 10,
                touchScrollStep: 90,
                alwaysVisible: !1,
                allowPageScroll: !0,
                color: "rgba(0,0,0,0.5)",
                height: "calc(100vh - 70px)",
                width: "100%"
            })
        }

    }),

    /* vertical menu functions  */
    $(window).resize(function() {
        togglemenu(), menuhrres()
    });
var ost = 0;
$.fn.pcodedmenu = function(e) {
        var s = (this.attr("id"), {
                themelayout: "vertical",
                MenuTrigger: "click",
                SubMenuTrigger: "click"
            }),
            e = $.extend({}, s, e),
            d = {
                PcodedMenuInit: function() {
                    d.HandleMenuTrigger(), d.HandleSubMenuTrigger(), d.HandleOffset()
                },
                HandleSubMenuTrigger: function() {
                    var s = $(window),
                        d = s.width();
                    if (1 == $(".coodiv-navbar").hasClass("theme-horizontal"))
                        if (d >= 768) {
                            var i = $(".coodiv-inner-navbar .coodiv-submenu > li.coodiv-hasmenu");
                            i.off("click").off("mouseenter mouseleave").hover(function() {
                                $(this).addClass("coodiv-trigger")
                            }, function() {
                                $(this).removeClass("coodiv-trigger")
                            })
                        } else {
                            var i = $(".coodiv-inner-navbar .coodiv-submenu > li > .coodiv-submenu > li");
                            i.off("mouseenter mouseleave").off("click").on("click", function() {
                                0 === $(this).closest(".coodiv-submenu").length ? $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-submenu > li > .coodiv-submenu > li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-inner-navbar").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown()) : $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-submenu > li > .coodiv-submenu > li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-submenu").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown())
                            }), $(".coodiv-inner-navbar .coodiv-submenu > li > .coodiv-submenu > li").on("click", function(e) {
                                e.stopPropagation(), alert("click call"), 0 === $(this).closest(".coodiv-submenu").length ? $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-hasmenu li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-inner-navbar").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown()) : $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-hasmenu li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-submenu").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown())
                            })
                        }
                    switch (e.SubMenuTrigger) {
                        case "click":
                            $(".coodiv-navbar .coodiv-hasmenu").removeClass("is-hover"), $(".coodiv-inner-navbar .coodiv-submenu > li > .coodiv-submenu > li").on("click", function(e) {
                                e.stopPropagation(), 0 === $(this).closest(".coodiv-submenu").length ? $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-submenu > li > .coodiv-submenu > li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-inner-navbar").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown()) : $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-submenu > li > .coodiv-submenu > li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-submenu").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown())
                            }), $(".coodiv-submenu > li").on("click", function(e) {
                                e.stopPropagation(), 0 === $(this).closest(".coodiv-submenu").length ? $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-hasmenu li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-inner-navbar").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown()) : $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($(".coodiv-hasmenu li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-submenu").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown())
                            })
                    }
                },
                HandleMenuTrigger: function() {
                    var s = $(window),
                        d = s.width();
                    if (1 == $(".coodiv-navbar").hasClass("theme-horizontal")) {
                        var i = $(".coodiv-inner-navbar > li");
                        d >= 768 ? i.off("click").off("mouseenter mouseleave").hover(function() {
                            if ($(this).addClass("coodiv-trigger"), $(".coodiv-submenu", this).length) {
                                var e = $(".coodiv-submenu:first", this),
                                    s = e.offset(),
                                    d = s.left,
                                    i = e.width();
                                $(window).height();
                                if (d + i <= $(window).width()) $(this).removeClass("edge");
                                else {
                                    var o = $(".sidenav-inner").attr("style");
                                    $(".sidenav-inner").css({
                                        "margin-left": parseInt(o.slice(12, o.length - 3)) - 80
                                    }), $(".sidenav-horizontal-prev").removeClass("disabled")
                                }
                            }
                        }, function() {
                            $(this).removeClass("coodiv-trigger")
                        }) : i.off("mouseenter mouseleave").off("click").on("click", function() {
                            $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($("li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-inner-navbar").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown())
                        })
                    }
                    switch (e.MenuTrigger) {
                        case "click":
                            $(".coodiv-navbar").removeClass("is-hover"), $(".coodiv-inner-navbar > li:not(.coodiv-menu-caption) ").on("click", function() {
                                $(this).hasClass("coodiv-trigger") ? ($(this).removeClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideUp()) : ($("li.coodiv-trigger").children(".coodiv-submenu").slideUp(), $(this).closest(".coodiv-inner-navbar").find("li.coodiv-trigger").removeClass("coodiv-trigger"), $(this).addClass("coodiv-trigger"), $(this).children(".coodiv-submenu").slideDown())
                            })
                    }
                },
                HandleOffset: function() {
                    switch (e.themelayout) {
                        case "horizontal":
                            "hover" === e.SubMenuTrigger ? $("li.coodiv-hasmenu").on("mouseenter mouseleave", function(e) {
                                if ($(".coodiv-submenu", this).length) {
                                    var s = $(".coodiv-submenu:first", this),
                                        d = s.offset(),
                                        i = d.left,
                                        o = s.width();
                                    $(window).height();
                                    i + o <= $(window).width() ? $(this).removeClass("edge") : $(this).addClass("edge")
                                }
                            }) : $("li.coodiv-hasmenu").on("click", function(e) {
                                if (e.preventDefault(), $(".coodiv-submenu", this).length) {
                                    var s = $(".coodiv-submenu:first", this),
                                        d = s.offset(),
                                        i = d.left,
                                        o = s.width();
                                    $(window).height();
                                    i + o <= $(window).width() || $(this).toggleClass("edge")
                                }
                            })
                    }
                }
            };
        d.PcodedMenuInit()
    },

    /* drop down menu when not collapsed */
    $("#menu").pcodedmenu({
        MenuTrigger: "click",
        SubMenuTrigger: "click"
    }),
    $("#mobile-collapse,#mobile-collapse1").click(function(e) {
        $(window)[0].innerWidth < 992 && ($(".coodiv-navbar").toggleClass("mob-open"), e.stopPropagation())
    }),
    $(window).ready(function() {
        var e = $(window)[0].innerWidth;
        $(".coodiv-navbar").on("click tap", function(e) {
                e.stopPropagation()
            }), $(".coodiv-main-container,.coodiv-header").on("click", function() {
                e < 992 && 1 == $(".coodiv-navbar").hasClass("mob-open") && ($(".coodiv-navbar").removeClass("mob-open"), $("#mobile-collapse,#mobile-collapse1").removeClass("on"))
            }),
            $("#mobile-header").on("click", function() {
                $(".navbar-collapse,.m-header").slideToggle()
            })
    });

/* drop down menu when collapsed */
var MenuOpenTimers = {}
$('.coodiv-hasmenu').each(function() {
    $(this).attr(
        'data-username',
        Math.random()
        .toString(36)
        .substring(3),
    )
})
$('.navbar-content').on('mouseover', '.nav-item', function() {
    var isActive = $('nav.coodiv-navbar').is('.navbar-collapsed')
    var isUnfixed = $('body').is('.body-move')
    var id = $(this).attr('data-username')
    var isDesktop = window.innerWidth > 768
    var submenuList = $(this).find('> .coodiv-submenu')
    var submenuTitle = $(this).find('.coodiv-mtext')
    var MenuContainer = $('.coodiv-submenu-clone[data-username=' + id + ']')
    var titleContainer = $('.coodiv-submenu-clone-title[data-username=' + id + ']')
    clearInterval(MenuOpenTimers[id])
    if (isActive && isDesktop && !MenuContainer.length && !titleContainer.length) {
        if (submenuList.length) {
            $('body').append('<div class="coodiv-submenu-clone" data-username="' + id + '"></div> <div class="coodiv-submenu-clone-title with-sub-menu" data-username="' + id + '"></div>')
        } else {
            $('body').append('<div class="coodiv-submenu-clone-title without-sub-menu" data-username="' + id + '"></div>')
        }
        var cloned = submenuList.clone()
        var clonedtitle = submenuTitle.clone()
        $('.coodiv-submenu-clone[data-username=' + id + ']').html(cloned)
        $('.coodiv-submenu-clone-title[data-username=' + id + ']').html(clonedtitle)
        var top = isUnfixed ? $(this).offset().top - $(window).scrollTop() : $(this).position().top + $('.coodiv-submenu').position().top
        var left = $(this).offset().left + $(this).innerWidth()
        var itemHeight = $(this).innerHeight()
        var flyoutHeight = $('.coodiv-submenu-clone[data-username=' + id + ']').innerHeight()
        $('.coodiv-submenu-clone[data-username=' + id + ']')
            .css({
                top: top,
                left: left - 0,
            })
            .addClass('coodiv-submenu-clone-animation')
        $('.coodiv-submenu-clone-title[data-username=' + id + ']')
            .css({
                top: top + 25,
                left: left + 25,
            })
            .addClass('coodiv-submenu-clone-animation-small')
    }
})
$('.navbar-content').on('mouseout', '.nav-item', function() {
    var isActive = $('nav.coodiv-navbar').is('.navbar-collapsed')
    if (!isActive) {
        return
    }
    var id = $(this).attr('data-username')
    MenuOpenTimers[id] = setTimeout(function() {
        $('.coodiv-submenu-clone[data-username=' + id + ']').remove()
        $('.coodiv-submenu-clone-title[data-username=' + id + ']').remove()
    }, 30)
})
$('body').on('mouseover', '.coodiv-submenu-clone,.coodiv-submenu-clone-title', function() {
    var isActive = $('nav.coodiv-navbar').is('.navbar-collapsed')
    if (!isActive) {
        return
    }
    var id = $(this).attr('data-username')
    clearInterval(MenuOpenTimers[id])
})
$('body').on('mouseout', '.coodiv-submenu-clone,.coodiv-submenu-clone-title', function() {
    var isActive = $('nav.coodiv-navbar').is('.navbar-collapsed')
    if (!isActive) {
        return
    }
    var id = $(this).attr('data-username')
    MenuOpenTimers[id] = setTimeout(function() {
        $('.coodiv-submenu-clone[data-username=' + id + ']').remove()
        $('.coodiv-submenu-clone-title[data-username=' + id + ']').remove()
    }, 30)
})
$('.alert').alert()
/* dark mode toggle */
$(".ThemeColorModeContainer").on("click", function() {
    $("body").toggleClass("dark-mode")
});
$(".darkmodeatt").on("click", function() {
    $("body").toggleClass("dark-mode")
});
/* remove Currency list from drop down*/
$('.dropdown-menu [menuitemname="Choose Currency"]').remove();



