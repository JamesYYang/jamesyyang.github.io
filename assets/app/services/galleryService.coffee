angular.module("GalleryService", [])
.factory "Galleries", ['$http','$q', ($http,$q) ->
    get: ->
      self=this
      deferred = $q.defer()
      if @data
        deferred.resolve @data
      else
        $http.get("/assets/app/gallery/gallery-data.json")
        .success (data) ->
            self.data=data
            deferred.resolve self.data
        .error (data) ->
            deferred.reject data
      deferred.promise
  ]