<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/timer.css">
    <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body ng-app="mainApp" ng-controller="mainController">
<div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" id="mainDialog">
        <form name="form" ng-submit="form.$valid && sendSubmit(auth)" ng-show="mainFormIsShow">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">Заполните форму<button type="button" class="close text-white" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
                <div class="modal-body" id="mainForm">
                    <div class="alert-danger p-2 text-center text-danger my-1" ng-show="badAuthData">{{statusResponseMessage}}</div>
                    <div class="form-group row">
                        <label for="input_name" class="col-sm-2 col-form-label" >Ваше имя:</label>
                        <div class="col-sm-10">
                            <input id="input_name" type="text" class="form-control" placeholder="Имя" name="name" required ng-model="auth.name" ng-pattern="/^[A-Za-zа-яА-ЯёЁ]{4,50}\s{0,1}[A-Za-zа-яА-ЯёЁ]{0,50}\s{0,1}[A-Za-zа-яА-ЯёЁ]{0,50}$/">
                            <span style="color: red" ng-show="form.name.$touched && form.name.$invalid">не корректное имя</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="input_email" class="col-sm-2 col-form-label" >Email:</label>
                        <div class="col-sm-10">
                            <input id="input_email" required name="email"  type="email" class="form-control" placeholder="email" ng-model="auth.email" ng-minlength="4" ng-maxlength="50" ng-pattern="regexEmail">
                            <span style="color: red" ng-show="form.email.$touched && form.email.$invalid">не корректный email</span>
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
                    <button type="submit" class="btn btn-danger mx-auto" ng-disabled="form.$invalid">Отпрваить</button>
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
                    <button type="submit" class="btn btn-danger mx-auto" ng-disabled="confirmForm.$invalid">Отпрваить</button>
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
<div class="w-50 mx-auto my-5 text-center text-white font-weight-bold wow bounceInUp">
    <h5 class="w-75 mx-auto py-1  text-center wow bounceInUp">Масстер класс</h5>
    <h5 class="wow bounceInUp" style="padding: 1%; width: 90%; margin: auto">“3 стратегии, сделавших нас миллионерами на трендах 2017-2018гг”</h5>

</div>
<div class="container wow slideInLeft">
    <div class="row">
        <div class="col-md-12">
            <div class="card text-white text-center mx-auto" style="background: black; width: 90%">
                <div class="card-header mx-auto text-center">До начала мероприятия осталось:</div>
                <div class="card-body">
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th >дни</th>
                            <th >
                            </th>
                            <th >часы</th>
                            <th ></th>
                            <th >минуты</th>
                            <th ></th>
                            <th >секунды</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td >

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

                            </td>
                            <td >
                                <ul class="flip"><li>/</li></ul>
                            </td>
                            <td >
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

                            </td>
                            <td >
                                <ul class="flip"><li>:</li></ul>
                            </td>
                            <td >

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

                            </td>
                            <td >
                                <ul class="flip"><li>:</li></ul>
                            </td>
                            <td>

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

                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row wow slideInRight">
        <div class="col-md-12">
            <div class="card text-white text-center mx-auto" style="background: black; width: 80%">
                <div class="card-header">Количество мест ограничено</div>
                <div class="card-body">
                    <table class="table table-borderless">
                        <thead class="">
                        <tr>
                            <th >осталось мест</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="mx-auto" style="width: 140px">
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
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-danger btn-lg btn-footer shadow" href="#" data-toggle="modal" data-target=#modal>записаться</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w-50 mx-auto text-center wow slideInLeft" style="color: green; font-weight: bold; margin-top: 10%">Для кого предназначен</div>
<p class="w-50 mx-auto text-center wow slideInRight" style="color: green; margin-top: 2%" id="typedtext"></p>
<canvas class="wow slideInLeft" id="c" style=" width: 100%; height: 200px;"></canvas>
<div class="container">
    <div class="row my-5">
        <div class="col-md-12">
            <div class="card" style="background: black; color: white">
                <div class="card-body">
                    Чего не будет на нашем мастер классе?
                    <ul>
                        <li>Скучно и занудно, это обещаю)</li>
                        <li>обучения продаж бытовой химии и продуктов питания</li>
                        <li>пустых обещаний.</li>
                    </ul>
                    <hr>
                    <p>Колличество миллионеров в России за прошлый год увеличилось на 20%<br>
                        На столько же процентов увеличилось число людей, с доходами ниже прожиточного мигниммума.</p>
                    <p>У человека всегда есть выбор, как поступить в своей жизни. Сложность заключается не в том,
                        что выбор труден, а в том, что за него придется нести ответственность, в первую очередь перед собой.
                        А это и становится непосильной ношей для многих.</p>
                    <p>Кто бы мне не говорил обратное, я убежден, человек всегда может выбрать, что ему делать.</p>
                    <hr>

                    <p>Следуй за свой мечтой!</p>

                </div>
            </div>
        </div>
    </div>
</div>
<footer class="text-center mt-5 pt-3 wow bounceInUp"  >
    <a class="btn btn-outline-danger btn-lg btn-footer shadow" href="#" data-toggle="modal" data-target=#modal>записаться</a>

    <div class="footer copyrigt py-3 mt-3 text-light w-75 mx-auto text-center"> © 2018 Copyright: nezabivai.ru
    </div>
</footer>
<script src='https://www.google.com/recaptcha/api.js'></script>

<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
<#--<script src="js/bootstrap.bundle.min.js"></script>-->
<script src="js/angular.min.js"></script>
<script src="js/main.js"></script>
<script src="js/timer.js"></script>
<script src="js/matrix-rain.js"></script>
<script src="js/typed-text.js"></script>
<script>
    // Init WOW.js and get instance
    var wow = new WOW();
    wow.init();
</script>
<script src="https://www.google.com/recaptcha/api.js?onload=onLoadRecapchaCallback&render=explicit" async defer></script>
</body>
</html>