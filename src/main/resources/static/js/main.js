var mainApp = angular.module("mainApp",[]);
mainApp.controller('mainController',function ($scope,$interval,$http) {
    var i=0;
    // $scope.regexEmail=/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    $scope.mainFormIsShow=true;
    $scope.confirmFromIsShow=false;
    $scope.succesMessageShow=false;
    $scope.sendSubmit=function(auth){
        $scope.auth._csrf= $("#csrf").val();
        $http({
            method: "POST",
            url:"/regisration",
            data: $.param(auth),
            headers: {"Content-Type":"application/x-www-form-urlencoded"}
        }).then(function (response) {
            console.log(response.data);
            if (response.data.status==="ok") {
                $scope.mainFormIsShow = false;
                $scope.confirmFromIsShow = true;
                $scope.succesMessageShow = false;
            }else{
                $scope.badAuthData=true;
                $scope.statusResponseMessage=response.data.message;
                $scope.mainFormIsShow=true;
                $scope.confirmFromIsShow=false;
                $scope.succesMessageShow=false;
            }
        }, function (response) {
            console.log("error");
            console.log(response.data)
        })
    };
    $scope.sendConfirm=function (confirm) {
        $scope.confirm._csrf=$("#csrf").val();
        $http({
            method: "POST",
            url:"/confirm",
            data: $.param(confirm),
            headers: {"Content-Type":"application/x-www-form-urlencoded"}
        }).then(function (response) {
            console.log("ok");
            console.log(response.data);
            if (response.data.status==="ok") {
                $scope.mainFormIsShow = false;
                $scope.confirmFromIsShow = false;
                $scope.succesMessageShow = true;
                $scope.statusResponseMessage = response.data.message;
            }else{
                $scope.mainFormIsShow = false;
                $scope.confirmFromIsShow = true;
                $scope.badCode=true;
                $scope.succesMessageShow = false;
                $scope.statusResponseMessage = response.data.message;
            }

        }, function (response) {
            console.log("error");
            console.log(response.data)
        })
    }
}).directive("recapcha",function () {
    return {
        restrict:"E",
        require:"ngModel",
        scope:{
            sitekey:"@",
            ngModel:"="
        },
        link: function (scope, element, attrs,ngModelCtrl) {
            window.onLoadRecapchaCallback = function () {
                grecaptcha.render(element.get(0),{
                    "sitekey":scope.sitekey,
                    "callback":onRecapchaSubmit,
                    "expired-callback":onRecaptchaExpired
                });
            };
            window.onRecapchaSubmit = function (gRecaptchaResponse) {
                scope.ngModel=gRecaptchaResponse;
                ngModelCtrl.$setViewValue(gRecaptchaResponse);
            };
            window.onRecaptchaExpired = function () {
                scope.ngModel="";
                ngModelCtrl.$setViewValue("");

            };
            ngModelCtrl.$validators.recaptchaValidate=function (modelValue, viewValue) {
                return !ngModelCtrl.$isEmpty(scope.ngModel);
            };
        }
    }
});






