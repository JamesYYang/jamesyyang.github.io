// Generated by CoffeeScript 1.7.1
(function() {
  angular.module("app", ["ngRoute", "chineseMedicine", "gallery", "gallery-detail", "GalleryService", "home"]).config([
    "$locationProvider", function($locationProvider) {
      return $locationProvider.html5Mode(false).hashPrefix('!');
    }
  ]).config([
    "$routeProvider", function($routeProvider) {
      return $routeProvider.otherwise({
        redirectTo: "/"
      });
    }
  ]).run([
    "$rootScope", "$location", function($rootScope, $location) {
      var bgNames, randomShuffle;
      bgNames = ["bg-1", "bg-2", "bg-3", "bg-4", "bg-5", "bg-6", "bg-7", "bg-8", "bg-9", "bg-10", "bg-11", "bg-12", "bg-13"];
      randomShuffle = function(array) {
        var currentIndex, randomIndex, tempValue;
        currentIndex = array.length;
        while (currentIndex !== 0) {
          randomIndex = Math.floor(Math.random() * currentIndex);
          currentIndex--;
          tempValue = array[currentIndex];
          array[currentIndex] = array[randomIndex];
          array[randomIndex] = tempValue;
        }
        return array;
      };
      return $rootScope.bgName = randomShuffle(bgNames)[0];
    }
  ]);

}).call(this);

//# sourceMappingURL=app.map
