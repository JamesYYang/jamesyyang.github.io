angular.module("app",
["ngRoute"
"chineseMedicine"
"gallery"
"gallery-detail"
"GalleryService"
"home"
])
.config(["$locationProvider",($locationProvider) ->
    $locationProvider.html5Mode(false).hashPrefix('!')
])
.config(["$routeProvider",($routeProvider) ->
    $routeProvider.otherwise redirectTo: "/"
])
.run(["$rootScope","$location", ($rootScope,$location) ->
    bgNames = ["bg-1", "bg-2", "bg-3", "bg-4", "bg-5", "bg-6", "bg-7", "bg-8", "bg-9", "bg-10", "bg-11", "bg-12", "bg-13"]

    randomShuffle = (array)->
      currentIndex = array.length
      while currentIndex isnt 0
        randomIndex = Math.floor(Math.random() * currentIndex)
        currentIndex--
        tempValue = array[currentIndex]
        array[currentIndex] = array[randomIndex]
        array[randomIndex] = tempValue

      array

    $rootScope.bgName = randomShuffle(bgNames)[0]
])