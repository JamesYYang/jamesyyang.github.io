angular.module("app",
["ngRoute"
"chineseMedicine"
"gallery"
"gallery-detail"
"GalleryService"
"home"
])
.config(["$locationProvider",($locationProvider) ->
    $locationProvider.html5Mode(true)
])
.config(["$routeProvider",($routeProvider) ->
    $routeProvider.otherwise redirectTo: "/"
])