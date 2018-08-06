var app=angular.module("adminApp",[]);
app.controller("mainController",function ($scope, $http) {
    $scope.sendSubmit=function (event) {
        console.log("отправляем"+event.name);
        $http.post('/admin/create_event')
            .then(function (response) {
                console.log(response.data);
            })
            .catch(function (reason) {
                console.log(reason)
            })
    };
});