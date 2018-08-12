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

    // $("body").removeClass('body1');
    // $("body").addClass('body2');
    // $("body").removeClass('body3');
    //
    // $("body").removeClass('body1');
    // $("body").removeClass('body2');
    // $("body").addClass('body3');
    //
    // $("body").addClass('body1');
    // $("body").removeClass('body2');
    // $("body").removeClass('body3');

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
var flag =true;
$(window).scroll(function() {
    var windowY = $(window).height();
    var scrolledY = $(window).scrollTop();
    var isNotTheFirstScroll=false;
    // if ($('.block01').height()<windowY){
    //     $('.block01').height(windowY);
    // }
    // if ($('.block02').height()<windowY){
    //     $('.block02').height(windowY);
    // }
    // if ($('.block03').height()<windowY){
    //     $('.block03').height(windowY);
    // }
    // if ($('.block04').height()<windowY){
    //     $('.block04').height(windowY);
    // }
    // var h = $('.block01').offset().top-$(window).scrollTop();
    //
    // if (flag){
    //     $("html, body").animate({ scrollTop: windowY*1.07}, 1000);
    //     flag=false;
    //     console.log("проскролено")
    // }
    // console.log(h+" || "+windowY);

    console.log($('body').height())

    if (scrolledY<=$('.block01').height()*1.05){
        $("body").addClass('body1');
        $("body").removeClass('body2');
        $("body").removeClass('body3');
        // var image_url = 'images/page03/banner-10.jpg';
    } else if (scrolledY > $('.block01').height()*1.05 && scrolledY < ($('.block01').height()+$('.block02').height()+$('.block03').height())*1.03) {
        $("body").addClass('body2');
        $("body").removeClass('body3');
        $("body").removeClass('body1');
        // image_url = 'images/page03/bg03.jpg';
    }else if (scrolledY > ($('.block01').height()+$('.block02').height()+$('.block03').height())*1.03){
        $("body").addClass('body3');
        $("body").removeClass('body2');
        $("body").removeClass('body1');
        // image_url = 'images/page03/willa.jpg';
    }
    // $("body").css({'background':"url(" + image_url + ")","background-size": "cover","background-repeat": "no-repeat","background-attachment": "fixed"});

});