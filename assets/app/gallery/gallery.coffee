angular.module("gallery",[])

.config(["$routeProvider",
    ($routeProvider)->
      $routeProvider.when("/gallery",
        templateUrl: "/assets/app/gallery/gallery.tpl.html"
        controller: "galleryCtrl"
        resolve:
          galleryData: ["Galleries", (Galleries)->
            Galleries.get()
          ]
      )
  ])

.controller("galleryCtrl", ["$scope", "galleryData", "$rootScope", ($scope, galleryData, $rootScope)->
  $scope.galleries = galleryData
  $rootScope.isSubPage = true
])