$(document).ready(function () {
    var windowY = $(window).height();
    if ($('.block01').height()<windowY){
        $('.block01').height(windowY);
    }
    if ($('.block02').height()<windowY){
        $('.block02').height(windowY);
    }
    if ($('.block03').height()<windowY){
        $('.block03').height(windowY);
    }
    if ($('.block04').height()<windowY){
        $('.block04').height(windowY);
    }
});

$(window).on('resize', function(){
    var windowY = $(window).height();
    if ($('.block01').height()<windowY){
        $('.block01').height(windowY);
    }
    if ($('.block02').height()<windowY){
        $('.block02').height(windowY);
    }
    if ($('.block03').height()<windowY){
        $('.block03').height(windowY);
    }
    if ($('.block04').height()<windowY){
        $('.block04').height(windowY);
    }
});

$(window).scroll(function() {
    var windowY = $(window).height();
    var scrolledY = $(window).scrollTop();
    var isNotTheFirstScroll=false;
    if ($('.block01').height()<windowY){
        $('.block01').height(windowY);
    }
    if ($('.block02').height()<windowY){
        $('.block02').height(windowY);
    }
    if ($('.block03').height()<windowY){
        $('.block03').height(windowY);
    }
    if ($('.block04').height()<windowY){
        $('.block04').height(windowY);
    }
    if (scrolledY<=windowY*1.1){
        $("body").addClass('body1');
        $("body").removeClass('body2');
        $("body").removeClass('body3');
        // var image_url = 'images/page03/banner-10.jpg';
    } else if (scrolledY > windowY*1.1 && scrolledY  < windowY*3.1) {
        $("body").addClass('body2');
        $("body").removeClass('body3');
        $("body").removeClass('body1');
        // image_url = 'images/page03/bg03.jpg';
    }else if (scrolledY > windowY*3){
        $("body").addClass('body3');
        $("body").removeClass('body2');
        $("body").removeClass('body1');
        // image_url = 'images/page03/willa.jpg';
    }
    // $("body").css({'background':"url(" + image_url + ")","background-size": "cover","background-repeat": "no-repeat","background-attachment": "fixed"});

});