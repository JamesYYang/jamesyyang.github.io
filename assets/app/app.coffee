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
    bgNames = ["root-bg-1", "root-bg-2", "root-bg-3", "root-bg-4", "root-bg-5", "root-bg-6", "root-bg-7", "root-bg-8", "root-bg-9", "root-bg-10"]

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