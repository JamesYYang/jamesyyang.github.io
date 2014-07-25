angular.module('gallery-detail', [])

.config(["$routeProvider", ($routeProvider) ->
    $routeProvider
    .when "/gallery/:name",
        templateUrl: "/assets/app/gallery/gallery-detail.tpl.html"
        controller: 'GalleryDetailCtrl'
        resolve:
          galleryData: ["Galleries", (Galleries)->
            Galleries.get()
          ]
  ])

.controller('GalleryDetailCtrl',
["$scope","$timeout", "$route", "galleryData", ($scope,$timeout, $route, galleryData) ->
  $scope.gallery = g for g in galleryData when g.name is $route.current.params.name

  #TODO:改为指令加载相册
  $.fn.photobox('prepareDOM')
  $('.gallery').photobox('a',{history:false})
  i=0
  j=0
  $timeout(->
    for item in $(".gallery li")
      $timeout(->
        i
        $($(".gallery li")[j++]).addClass('loaded')
        25 * i++)
    500)
])