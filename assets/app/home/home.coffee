angular.module("home",[])

.config(["$routeProvider",
    ($routeProvider)->
      $routeProvider.when("/",
        templateUrl: "/assets/app/home/home.tpl.html"
        controller: "homeCtrl")
  ])

.controller("homeCtrl", ["$scope", "$rootScope", ($scope, $rootScope)->
    $rootScope.isSubPage = false
])