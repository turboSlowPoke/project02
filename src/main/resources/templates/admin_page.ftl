<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/frameworks/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Orbitron" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body ng-app="adminApp" ng-controller="mainController">
<div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" id="mainDialog">
        <form name="form" ng-submit="form.$valid && sendSubmit()" ng-show="mainFormIsShow">
            <div class="modal-content">
                <div class="modal-header">Создать мероприятие<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
                <div class="modal-body" id="mainForm">
                    <div class="alert-danger p-2 text-center text-danger my-1" ng-show="error">{{statusResponseMessage}}</div>
                    <div class="form-group row">
                        <label for="input_name" class="col-sm-2 col-form-label" >Название:</label>
                        <div class="col-sm-10">
                            <input id="input_name" type="text" class="form-control"  name="name"  ng-model="event.name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="input_datetime" class="col-sm-2 col-form-label" >Дата время</label>
                        <div class="col-sm-10">
                            <input id="input_datetime"  name="datetime"  type="datetime-local" class="form-control" ng-model="event.datetime">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="input_seats" class="col-sm-2 col-form-label" >Количество участниокв</label>
                        <div class="col-sm-10">
                            <input id="input_seats" type="number" class="form-control" name="allSeats" ng-model="event.allSeats" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="input_place" class="col-sm-2 col-form-label">Место проведения</label>
                        <div class="col-sm-10">
                            <input id="input_place" type="text" class="form-control" name="place" ng-model="event.place" >
                        </div>
                    </div>
                </div>
                <div class="modal-footer ">
                    <button type="submit" class="btn btn-primary " ng-disabled="form.$invalid">Отпрваить</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>

<div class="container container-fluid">
    <div class="row my-2">
        <div class="card">
            <div class="card-header">Список мероприятий</div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>название</th>
                        <th>дата</th>
                        <th>всего мест</th>
                        <th>осталось мест</th>
                        <th>место проведения</th>
                        <th>статус</th>
                    </tr>
                    </thead>
                    <tbody ng-repeat="event in eventList">
                    <tr>
                        <td>{{event.id}}</td>
                        <td>{{event.name}}</td>
                        <td>{{event.datetime | date : 'short'}}</td>
                        <td>{{event.allSeats}}</td>
                        <td>{{event.countSeats}}</td>
                        <td>{{event.place}}</td>
                        <td>{{event.status}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <a class="btn btn-primary text-white" data-toggle="modal" data-target=#modal>Создать мероприятие</a>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="card">
            <div class="card-header">Список юзеров</div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>имя</th>
                        <th>телефон</th>
                        <th>статус номера</th>
                        <th>дата регистрации</th>
                        <th>номер мероприятия</th>

                    </tr>
                    </thead>
                    <tbody ng-repeat="user in userList">
                    <tr>
                        <td>{{user.id}}</td>
                        <td>{{user.name}}</td>
                        <td>{{user.phone }}</td>
                        <td>{{user.status}}</td>
                        <td>{{user.registrationDate| date : 'short'}}</td>
                        <td>{{user.eventId}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>


<script src="js/frameworks/jquery.min.js"></script>
<script src="js/frameworks/bootstrap.min.js"></script>
<script src="js/frameworks/angular.min.js"></script>
<script src="js/admin_page.js"></script>
</body>
</html>