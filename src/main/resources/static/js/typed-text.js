var aText = new Array(
    "У меня нет времени.",
    "Уже слишком поздно, вот если бы я начал раньше…",
    "Это слишком трудно.",
    "Я просто жду вдохновения.",
    "У меня пока недостаточно денег.",
    "Я сегодня слишком устал.",
    "Я обязательно начну завтра, на следующей неделе, в следующем месяце, в следующем году.",
    "Я слишком молод.",
    "Я слишком стар.",
    "У меня нет нужного таланта.",
    "Это отнимет слишком много времени.",
    "Я не достаточно умен для этого.",
    "У меня нет необходимого опыта.",
    "Я слишком занят.",
    "Мне придется забросить людей, которые нуждаются во мне.",
    "Я не уверен, что это правильное решение.",
    "Что, если у меня не получится?",
    "Я и так не плохо живу.",
    "Это слишком рискованно.",
    "Мне страшно.",
    "Я не имею нужных ресурсов.",
    "Я слишком много вложил в свою нынешнюю работу.",
    "У меня нет нужных связей.",
    "Очень многие до меня уже пытались и потерпели неудачу.",
    "Я не знаю, как это сделать.",
    "Меня никто не поддержит.",
    "Я сделаю это, когда дети станут постарше.",
    "У меня нет навыков.",
    "В экономике сейчас не самый подходящий момент.",
    "Я не знаю с чего начать.",
    "Мне не хватит сил.",
    "Слишком много конкурентов.",
    "Никто никогда не делал этого раньше.",
    "Все говорят, что это невозможно.",
    "Сейчас просто не время."
);
var iSpeed = 100; // time delay of print out
var iIndex = 0; // start printing array at this position
var iArrLength = aText[1].length; // the length of the text array
var iScrollAt = 20; // start scrolling up at this many lines

var iTextPos = 0; // initialise text position
var sContents = ''; // initialise contents variable
var iRow; // initialise current row

function typewriter()
{
    sContents =  ' ';
    iRow = Math.max(0, iIndex-iScrollAt);
    var destination = document.getElementById("typedtext");

    // while ( iRow < iIndex ) {
    //     sContents += aText[iRow++] + '<br />';
    // }
    destination.innerHTML = sContents + aText[iIndex].substring(0, iTextPos) + "_";
    if ( iTextPos++ == iArrLength ) {
        iTextPos = 0;
        iIndex++;
        if ( iIndex != aText.length ) {
            iArrLength = aText[iIndex].length;
            setTimeout("typewriter()", 300);
        }
    } else {
        setTimeout("typewriter()", iSpeed);
    }
}

typewriter();