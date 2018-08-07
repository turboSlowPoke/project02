var app=angular.module("adminApp",[]);
app.controller("mainController",function ($scope, $http) {
    $scope.mainFormIsShow=true;
    $scope.succesMessageShow=false;
    $scope.sendSubmit=function () {
        $http.post('/admin/create_event',$scope.event)
            .then(function (response) {
                console.log(response.data);
            })
            .catch(function (reason) {
                console.log(reason)
            })
    };
});