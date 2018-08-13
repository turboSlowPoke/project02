$(document).ready(function(){
    $('.slider').slick({
        accessibility: true,
        autoplay:true,
        arrows:true,
        respondTo:'slider',
        infinite:true,
        prevArrow: $('.prev'),
        nextArrow: $('.next'),
    });
    $('.slider1').slick({
        accessibility: true,
        autoplay:true,
        arrows:true,
        respondTo:'slider',
        infinite:true,
        prevArrow: $('.prev1'),
        nextArrow: $('.next1'),
    });
});