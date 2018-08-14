var app=angular.module("adminApp",[]);
app.controller("mainController",function ($scope, $http) {
    $scope.eventList=[];
    $scope.userList=[];
    $http.get('/admin/event_list')
        .then(function (response) {
            $scope.eventList=response.data;
        })
        .catch(function (reason) {
            console.log(reason);
        });
    $http.get('/admin/user_list')
        .then(function (response) {
            $scope.userList=response.data;
        })
        .catch(function (reason) {
            console.log(reason);
        });
    $scope.mainFormIsShow=true;
    $scope.succesMessageShow=false;
    $scope.sendSubmit=function () {
        $http.post('/admin/create_event',$scope.event)
            .then(function (response) {
                $scope.mainFormIsShow=false;
                $scope.succesMessageShow=true;
                $scope.statusResponseMessage=response.data.message;
                $http.get('/admin/event_list')
                    .then(function (response) {
                        $scope.eventList=response.data;
                    })
                    .catch(function (reason) {
                        console.log(reason);
                    });
            })
            .catch(function (reason) {
                console.log(reason)
            });
    };
    $scope.stopEvent = function (event) {
        console.log(event);
        $http.post('/admin/stop_event',event)
            .then(function (response) {
                $scope.eventList=response.data;
            })
            .catch(function (reason) {
                console.log(reason);
            });

    }


    
});