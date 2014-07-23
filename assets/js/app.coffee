angular.module("app",
["ngRoute"
"chineseMedicine"
])
.config(["$locationProvider",($locationProvider) ->
    $locationProvider.html5Mode(true)
])
.config(["$routeProvider",($routeProvider) ->
    $routeProvider.otherwise redirectTo: "/"
])