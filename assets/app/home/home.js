// Generated by CoffeeScript 1.7.1
(function() {
  angular.module("home", []).config([
    "$routeProvider", function($routeProvider) {
      return $routeProvider.when("/", {
        templateUrl: "/assets/app/home/home.tpl.html",
        controller: "homeCtrl"
      });
    }
  ]).controller("homeCtrl", [
    "$scope", "$rootScope", function($scope, $rootScope) {
      return $rootScope.isSubPage = false;
    }
  ]);

}).call(this);

//# sourceMappingURL=home.map
