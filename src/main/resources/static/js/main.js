var mainApp = angular.module("mainApp",[]);
var replics = [
    "Хочешь узнать что это такое?",
    "Возьмешь синюю таблетку — и история здесь закончится: ты проснешься и будешь дальше ходить на свою любимую работу, надеясь что когда-нибудь случиться чудо.",
    "Возьмешь красную таблетку — останешься в Стране Чудес, и я покажу тебе, насколько глубока эта кроличья нора."
];
var items = [
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
];
var days=10;
var hours=11;
var minutes=12;
var seconds=13;
var smsCodeElement="<div class=\"form-group row\">\n" +
    "                        <label for=\"input_code\" class=\"col-sm-2 col-form-label\" >Код из SMS:</label>\n" +
    "                        <div class=\"col-sm-10\">\n" +
    "                            <input id=\"input_code\" type=\"number\" class=\"form-control\" name=\"smsCode\" ng-model=\"smsCode\">\n" +
    "                        </div>\n" +
    "                    </div>";
mainApp.controller('mainController',function ($scope,$interval,$http) {
    var i=0;
    $scope.replic01=replics[0];
    $interval(function () {
        if (i < replics.length - 1)
            i++;
        else
            i=0;
        switch (i){
            case 0:
                $scope.replic01=replics[0];
                $scope.replic02="";
                break;
            case 1:
                $scope.replic01="";
                $scope.replic02=replics[1];
                break;
            case 2:
                $scope.replic01=replics[2];
                $scope.replic02="";
                break;

        }
        $scope.replic=replics[i];
        },5000);

    $interval(function () {
        seconds--;
        if (seconds===-1) {
            seconds = 59;
            minutes--;
        }
        if (minutes===-1) {
            minutes = 59;
            hours--;
        }
        if (hours===-1){
            hours=23;
            if(days>0) {
                days--;
            }
        }
        $scope.days=days;
        $scope.hours=hours;
        $scope.minutes=minutes;
        $scope.seconds=seconds;
        }
        ,1000);
    var j=0;
    $scope.item=items[j];
    $scope.changeItem=function () {
        if (j < items.length - 1)
            j++;
        else
            j=0;
        $scope.item=items[j];
    };
    $scope.sendTestJson = function () {
        var newUser = {
            "name": $scope.name,
            "email": $scope.email,
            "phone": $scope.phone
        };
       $http.post('/add_user',newUser).then(function (response) {
           console.log(response.data);
           var user = response.data;
           var mainForm = angular.element(document.querySelector('#mainForm'));
           mainForm.children().remove();
           mainForm.append(smsCodeElement);

       });
    }
});






