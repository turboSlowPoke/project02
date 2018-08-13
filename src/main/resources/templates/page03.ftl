<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="css/page03.css">
    <link rel="stylesheet" href="css/frameworks/bootstrap.min.css">
    <link rel="stylesheet" href="css/timer.css">
    <link rel="stylesheet" href="css/frameworks/slick.css">
    <link rel="stylesheet" href="css/frameworks/slick-theme.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">


</head>
<body class="body1"  ng-app="mainApp" ng-controller="mainController">
<div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" id="mainDialog">
            <form name="form" ng-submit="form.$valid && sendSubmit(auth)" ng-show="mainFormIsShow">
                <div class="modal-content ">
                    <div class="modal-header">Заполните форму<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
                    <div class="modal-body" id="mainForm">
                        <div class="alert-danger p-2 text-center text-danger my-1" ng-show="badAuthData">{{statusResponseMessage}}</div>
                        <div class="form-group row">
                            <label for="input_name" class="col-sm-2 col-form-label" >Ваше имя:</label>
                            <div class="col-sm-10">
                                <input id="input_name" type="text" class="form-control" placeholder="Имя* Отчество Фамилия" name="name" required ng-model="auth.name" ng-pattern="/^[A-Za-zа-яА-ЯёЁ]{4,50}\s{0,1}[A-Za-zа-яА-ЯёЁ]{0,50}\s{0,1}[A-Za-zа-яА-ЯёЁ]{0,50}$/">
                                <span style="color: red" ng-show="form.name.$touched && form.name.$invalid">не корректное имя</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="input_phone" class="col-sm-2 col-form-label" >Мобильный телефон:</label>
                            <div class="col-sm-10">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">+7</div>
                                    </div>
                                    <input id="input_phone" type="text" class="form-control" placeholder="9012345678" name="phone" ng-model="auth.phone" required ng-pattern="/[9][0-9]{9}$/">
                                </div>
                                <span style="color: red" ng-show="form.phone.$touched && form.phone.$invalid">не корректный номер</span>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label" for="recaptcha"></label>
                            <div class="col-sm-10">
                                <recapcha sitekey="6Ldhk2YUAAAAABtquHgbj6x9LjpmOKl1BTmwO4bK" ng-model="auth.recapchaResponse"></recapcha>
                            </div>
                        </div>
                        <input id="csrf" type="hidden"  name="_csrf" value="${_csrf.token}" ng-model="auth._csrf">
                    </div>
                    <div class="modal-footer ">
                        <button type="submit" class="btn btn-danger mx-auto" ng-disabled="form.$invalid">Отправить</button>
                    </div>
                </div>
            </form>
            <form name="confirmForm" ng-submit="confirmForm.$valid && sendConfirm(confirm)" ng-show="confirmFromIsShow">
                <div class="modal-content">
                    <div class="modal-header">Подтверждение<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="input_code" class="col-sm-2 col-form-label" >Введите код из SMS:</label>
                            <div class="col-sm-10">
                                <div class="alert-danger p-2 text-center text-danger" ng-show="badCode">{{statusResponseMessage}}</div>
                                <input id="input_code" type="text" class="form-control" placeholder="123456" name="code" required ng-model="confirm.code" ng-pattern="/^[0-9]{6}$/">

                                <span style="color: red" ng-show="confirmForm.code.$touched && confirmForm.code.$invalid">не корректный код</span>
                            </div>
                        </div>
                        <input id="csrf" type="hidden"  name="_csrf" value="${_csrf.token}" ng-model="auth._csrf">
                    </div>
                    <div class="modal-footer ">
                        <button type="submit" class="btn btn-danger mx-auto" ng-disabled="confirmForm.$invalid">Отправить</button>
                    </div>
                </div>
            </form>
            <div class="modal-content" ng-show="succesMessageShow">
                <div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
                <div class="modal-body">
                    <div class="alert-info py-3 text-center">
                        <h5>{{statusResponseMessage}}</h5>
                    </div>
                </div>
                <div class="modal-footer ">
                    <button class="btn btn-primary mx-auto" type="button" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>

<div class="block01 container-fluid " >
    <div class="row my-5">
        <div class="col-md-4 "></div>
        <div class="col-md-4 text-center">
            <h1 class="caption01 text-center"><span style="background:#FEB225;color: white; padding: 0.5%">мастер класс</span></h1>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="row">
        <div class="col-md-1 col-lg-2 col-xl-3"></div>
        <div class="col-md-10 col-lg-8 col-xl-6">
            <div class="box_frame01 mx-auto text-center">
                <div class="box01">
                    <h1 style="padding: 5%;">3 стратегии,<br> сделавшие нас миллионерами на трендах 2017-2018гг</h1>
                    <div class="subscribe_btn" ><a href="#" style="color: white" data-toggle="modal" data-target=#modal ><h3>принять участие</h3></a></div>
                </div>
            </div>
        </div>
        <div class="col-md-1 col-lg-2 col-xl-3"></div>
    </div>

</div>
<div class="block02 container-fluid py-2 ">
    <div class="row py-3 py-sm-3 py-md-5 py-lg-5 py-xl-5">
        <div class="col-md-2 col-lg-3 col-xl-3"></div>
        <div class="col-md-10 col-lg-6 col-xl-6">
            <h1 class="caption02 mx-auto" ><span style="background:#FEB225;color: white; padding: 0.5%">до ближайшего мероприятия осталось</span></h1>
        </div>
        <div class="col-md-2  col-lg-3 col-xl-3"></div>
    </div>
    <div class="row  mb-2 mb-sm-2 mb-md-5 mb-lg-5 mb-xl-5">
        <div class="col-12 mb-5">
            <div class="mytimer">
                <div class="time-units">
                    <ul class="flip dayPlayDozens">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="flip dayPlayUnits">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <p>дни</p>
                </div>
                <div class="time-units">
                    <ul class="flip hourPlayDozens">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="flip hourPlayUnits">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <p>часы</p>
                </div>
                <div class="time-units">
                    <ul class="flip minutePlayDozens">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="flip minutePlayUnits">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <p>минуты</p>
                </div>
                <div class="time-units">
                    <ul class="flip secondPlayDozens">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="flip secondPlayUnits">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <p>секунды</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-2 col-lg-3 col-xl-3"></div>
        <div class="col-md-10 col-lg-6 col-xl-6">
            <h1 class="caption02"><span style="background:#FEB225;color: white; padding: 0.5%">количество мест ограничено</span></h1>
        </div>
        <div class="col-md-2 col-lg-3 col-xl-3"></div>
    </div>
    <div class="row mb-2 mb-sm-2 mb-md-5 mb-lg-5 mb-xl-5 ">
        <div class="col-12">
            <div class="days_count_down">
                <div class="time-units">
                    <ul class="flip dayPlayDozens">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="flip dayPlayUnits">
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">9</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">8</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">7</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">6</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">5</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">4</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">3</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">2</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">1</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="up">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                                <div class="down">
                                    <div class="shadow"></div>
                                    <div class="inn">0</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <p>места</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row my-2 my-sm-2 my-md-5 my-lg-5 my-xl-5">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="subscribe_btn mt-5" ><a href="#" style="color: white" data-toggle="modal" data-target=#modal><h3>принять участие</h3></a></div>
        </div>
        <div class="col-lg-4"></div>
    </div>
</div>
<div class="block03 container-fluid  pt-5">
    <div class="row my-lg-5 my-xl-5">
        <div class="col-md-2 "></div>
        <div class="col-md-8 my-lg-5 my-xl-5">
            <h1 class="text-center  caption01"><span style="background:#FEB225;color: white; padding: 0.5%"> для кого предназначен мастер класс</span></h1>
        </div>
        <div class="col-md-2"></div>

    </div>
    <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="box_frame01">
                <div class="box01">
                    <div class="row">
                        <div class="col-1 p-0 m-0">
                            <div style="height: 30%;"></div>
                            <a class="prev1 m-0 p-0" style="color: red"><i class="fas fa-chevron-circle-left fa-2x"></i></a>
                        </div>
                        <div class="col-10">
                            <div class="slider1 my-5" style="font-size: 2em">
                                <div  >У меня нет времени</div>
                                <div >Уже слишком поздно, вот если бы я начал раньше…</div>
                                <div >Это слишком трудно</div>
                                <div >Я просто жду вдохновения</div>
                                <div >У меня пока недостаточно денег</div>
                                <div >Я сегодня слишком устал</div>
                                <div >Я слишком молод</div>
                                <div >Я слишком стар</div>
                                <div >У меня нет нужного таланта</div>
                                <div >Это отнимет слишком много времени</div>
                                <div >Я не достаточно умен для этого</div>
                                <div >У меня нет необходимого опыта</div>
                                <div >Я слишком занят</div>
                                <div >Мне придется забросить людей, которые нуждаются во мне</div>
                                <div >Я не уверен, что это правильное решение</div>
                                <div >Что, если у меня не получится?</div>
                                <div >Я и так не плохо живу</div>
                                <div >Это слишком рискованно</div>
                                <div >Мне страшно</div>
                                <div >Я не имею нужных ресурсов</div>
                                <div >Я слишком много вложил в свою нынешнюю работу</div>
                                <div >У меня нет нужных связей</div>
                                <div >Очень многие до меня уже пытались и потерпели неудачу</div>
                                <div >В экономике сейчас не самый подходящий момент</div>
                                <div >Сейчас просто не время</div>
                            </div>
                        </div>
                        <div class="col-1 p-0 m-0">
                            <div style="height: 30%"></div>
                            <a class="next1 m-0 p-0" style="color: red"><i class="fas fa-chevron-circle-right next fa-2x"></i></a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="subscribe_btn"><a href="#" style="color: white" data-toggle="modal" data-target=#modal><h3>принять участие</h3></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-2"></div>
    </div>
</div>
<div class="block04 container-fluid  pt-5">
    <div class="row my-2">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <h1 class="text-center caption01 my-2 "><span style="background:#FEB225;color: white; padding: 0.5%">чего не будет на нашем мастер классе</span></h1>
        </div>
        <div class="col-lg-2"></div>
    </div>
    <div class="row my-lg-5 my-5 my-sm-5 my-md-5 my-lg-2 my-xl-2">
        <div class="col-lg-3"></div>
        <div class="col-lg-6">
            <div class="row">
                <div class="col-1 m-0 p-0">
                    <div style="height: 40%"></div>
                    <a class="prev m-0 p-0" style="color: red"><i class="fas fa-chevron-circle-left fa-2x"></i></a>
                </div>
                <div class="col-10">
                    <div class="slider w-100" >
                        <div>
                            <div >
                                <img class="img-fluid" src="images/page03/slides/1.jpg">
                            </div>
                            <h3 class="text-center mt-1">скучно и занудно, это обещаем</h3>
                        </div>
                        <div>
                            <div >
                                <img class="img-fluid" src="images/page03/slides/2.jpg">
                            </div>
                            <h3 class="text-center mt-1">обучения продажам бытовой химии и продуктов питания</h3>
                        </div>
                        <div>
                            <div >
                                <img class="img-fluid" src="images/page03/slides/3.jpg">
                            </div>
                            <h3 class="text-center mt-1">пустых обещаний</h3>
                        </div>
                        <div>
                            <div >
                                <img class="img-fluid" src="images/page03/slides/4.jpg">
                            </div>
                            <h3 class="text-center mt-1">у нас не бизнес тренинги</h3>
                        </div>
                        <div>
                            <div >
                                <img class="img-fluid" src="images/page03/slides/5.jpg">
                            </div>
                            <h3 class="text-center mt-1">мы не свидетели Иеговы</h3>
                        </div>
                        <div>
                            <div >
                                <img class="img-fluid" src="images/page03/slides/6.jpg">
                            </div>
                            <h3 class="text-center mt-1">нет сказок бабушки Галины</h3>
                        </div>
                    </div>
                </div>
                <div class="col-1 m-0 p-0">
                    <div style="height: 40%"></div>
                    <a class="next m-0 p-0" style="color: red"><i class="fas fa-chevron-circle-right next fa-2x"></i></a>
                </div>
            </div>


        </div>
        <div class="col-lg-3">

        </div>
    </div>
    <div class="row my-5 my-sm-5 my-md-5 my-lg-2 my-xl-2">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="subscribe_btn my-5"><a href="#" style="color: white" data-toggle="modal" data-target=#modal><h3>принять участие</h3></a></div>
        </div>
        <div class="col-lg-4 my-5 my-sm-5 my-md-5 my-lg-2 my-xl-2"></div>
    </div>
</div>
<div class="block01 container-fluid  pt-5">
    <div class="row my-5">
        <div class="col-md-2 col-lg-3 col-xl-3"></div>
        <div class="col-md-8 col-lg-6 col-xl-6">
            <h1 class="caption01 text-center" style="background:#FEB225;color: white; padding: 0.5%">Количество миллионеров в россии <br>увеличилось за прошлый год на 20%</h1>
        </div>
        <div class="col-md-2 col-lg-3 col-xl-3"></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="box_frame01" style="border: 3px solid rgba(232,225,196,1);">
                <div class="box02" style="font-size: 1.4em; background: rgba(232,225,196,1);">
                    <p>На столько же процентов увеличилось число людей, с доходами ниже прожиточного мигниммума.</p>
                    <p>У человека всегда есть выбор, как поступить в своей жизни. Сложность заключается не в том,
                            что выбор труден, а в том, что за него придется нести ответственность, в первую очередь перед собой.
                            А это и становится непосильной ношей для многих.</p>
                    <p>Кто бы мне не говорил обратное, я убежден, человек всегда может выбрать, что ему делать.</p>
                    <hr>
                    <p style="font-size: 1.6em">Следуй за свой мечтой!</p>
                    <div class="subscribe_btn"><a href="#" style="color: white" data-toggle="modal" data-target=#modal ><h3>принять участие</h3></a></div>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>

</div>

<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="js/frameworks/jquery.min.js"></script>
<script src="js/frameworks/angular.min.js"></script>
<script src="js/frameworks/bootstrap.bundle.min.js"></script>
<script src="js/frameworks/slick.min.js"></script>
<script src="js/slider.js"></script>
<script src="js/change_bg.js"></script>
<script src="js/timer.js"></script>
<script src="js/main.js"></script>
<script src="https://www.google.com/recaptcha/api.js?onload=onLoadRecapchaCallback&render=explicit" async defer></script>

</body>
</html>