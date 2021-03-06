
var countSeconds="59";
var countMinutes="59";
var countHours="15";
var countDay="99";
var countSeat = "99";

$(document).ready(function () {
    if (typeof $('#timerMinutes').val() !== 'undefined'){
        countMinutes=$('#timerMinutes').val();
        countHours=$('#timerHours').val();
        countDay=$('#timerDays').val();
    }
    console.log("seatsCount="+$('#seatsCount').val());
    if (typeof $('#seatsCount').val() !== 'undefined'){
        countSeat=$('#seatsCount').val().toString();
        console.log("countSeat="+countSeat);
    }

    for (var i=9;i>countSeconds.substr(1);i--){
        secondPlayUnits();
    }
    for (var i=5;i>countSeconds.substr(0,1);i--){
        secondPlayDozens();
    }
    for (var i=9;i>countMinutes.substr(1);i--){
        minutePlayUnits();
    }
    for (var i=5;i>countMinutes.substr(0,1);i--){
        minutePlayDozens();
    }
    for (var i=9;i>countHours.substr(1);i--){
        hourPlayUnits();
    }
    for (var i=2;i>countHours.substr(0,1);i--){
        hourPlayDozens();
    }
    for (var i=9;i>countDay.substr(1);i--){
        dayPlayUnits();
    }
    for (var i=9;i>countDay.substr(0,1);i--){
        dayPlayDozens();
    }
    for (var i=9;i>countSeat.substr(1);i--){
        seatPlayUnits();
    }
    for (var i=9;i>countSeat.substr(0,1);i--){
        seatPlayDozens();
    }

});

setInterval(function () {
    secondPlayUnits();
    countSeconds--;
    if (countSeconds % 10===0) {
        secondPlayDozens();
    }
    if (countSeconds===0){
        countSeconds=60;
        countMinutes--;
        minutePlayUnits();
    }
    if (countMinutes%10===0&&countSeconds%60===0){
        minutePlayDozens();
    }
    if (countMinutes===0){
        countMinutes=60;
        countHours--;
        hourPlayUnits();
    }
    if (countHours%10===0&&countMinutes%60===0&&countSeconds%60===0){
        hourPlayDozens();
    }
    if (countHours===0){
        countHours=24;
    }
}, 1000);

function secondPlayUnits() {
    $("body").removeClass("play");
    var aa = $("ul.secondPlayUnits li.active");

    if (aa.html() == undefined) {
        aa = $("ul.secondPlayUnits li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.secondPlayUnits li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.secondPlayUnits li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.secondPlayUnits li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function secondPlayDozens() {
    $("body").removeClass("play");
    var aa = $("ul.secondPlayDozens li.active");

    if (aa.html() == undefined) {
        aa = $("ul.secondPlayDozens li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.secondPlayDozens li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.secondPlayDozens li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.secondPlayDozens li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function minutePlayUnits() {
    $("body").removeClass("play");
    var aa = $("ul.minutePlayUnits li.active");

    if (aa.html() == undefined) {
        aa = $("ul.minutePlayUnits li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.minutePlayUnits li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.minutePlayUnits li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.minutePlayUnits li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function minutePlayDozens() {
    $("body").removeClass("play");
    var aa = $("ul.minutePlayDozens li.active");

    if (aa.html() == undefined) {
        aa = $("ul.minutePlayDozens li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.minutePlayDozens li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.minutePlayDozens li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.minutePlayDozens li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function hourPlayUnits() {
    $("body").removeClass("play");
    var aa = $("ul.hourPlayUnits li.active");

    if (aa.html() == undefined) {
        aa = $("ul.hourPlayUnits li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.hourPlayUnits li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.hourPlayUnits li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.hourPlayUnits li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function hourPlayDozens() {
    $("body").removeClass("play");
    var aa = $("ul.hourPlayDozens li.active");

    if (aa.html() == undefined) {
        aa = $("ul.hourPlayDozens li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.hourPlayDozens li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.hourPlayDozens li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.hourPlayDozens li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function dayPlayUnits() {
    $("body").removeClass("play");
    var aa = $("ul.dayPlayUnits li.active");

    if (aa.html() == undefined) {
        aa = $("ul.dayPlayUnits li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.dayPlayUnits li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.dayPlayUnits li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.dayPlayUnits li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function dayPlayDozens() {
    $("body").removeClass("play");
    var aa = $("ul.dayPlayDozens li.active");

    if (aa.html() == undefined) {
        aa = $("ul.dayPlayDozens li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.dayPlayDozens li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.dayPlayDozens li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.dayPlayDozens li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function seatPlayUnits() {
    $("body").removeClass("play");
    var aa = $("ul.seatPlayUnits li.active");

    if (aa.html() == undefined) {
        aa = $("ul.seatPlayUnits li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.seatPlayUnits li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.seatPlayUnits li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.seatPlayUnits li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}

function seatPlayDozens() {
    $("body").removeClass("play");
    var aa = $("ul.seatPlayDozens li.active");

    if (aa.html() == undefined) {
        aa = $("ul.seatPlayDozens li").eq(0);
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");

    }
    else if (aa.is(":last-child")) {
        $("ul.seatPlayDozens li").removeClass("before");
        aa.addClass("before").removeClass("active");
        aa = $("ul.seatPlayDozens li").eq(0);
        aa.addClass("active")
            .closest("body")
            .addClass("play");
    }
    else {
        $("ul.seatPlayDozens li").removeClass("before");
        aa.addClass("before")
            .removeClass("active")
            .next("li")
            .addClass("active")
            .closest("body")
            .addClass("play");
    }

}



