app.controller 'MainCtrl', [
  '$scope'
  'datacontext'
  '$modal',
  '$resource'
  ($scope, datacontext, $modal,$resource) ->
    
    #init Scope variable
    $scope.max = 5
    $scope.isReadonly = false
    
    
    #Search By 
    $scope.query = {}
    $scope.queryBy = '$'
        
    ###*Globalisation*###
  GetJsonResource = (language) ->
    languageFilePath = 'Languages/' + language + '.json'
    $resource(languageFilePath).get (data) ->
      $scope.translation = data
      return
    return
    
   GetJsonResource('en')
 
    #Rate, give note to recipe
    $scope.hoveringOver = (value) ->
      $scope.overStar = value
      return

    $scope.UpdateRate = (recipe) ->
      rate = recipe.rate
      #alert(recipe.rate);
      datacontext.updateRecipe(recipe).success (data) ->
        $scope.$broadcast 'ReloadRecipe', 'Some data'
        return
      return


    #Refrech list after adding new recipe
    $scope.$on 'ReloadRecipe', (event, data) ->
      datacontext.getAllRecipe().success (data) ->
        $scope.listRecipe = data
        return
      return
      
    #Get all recipes 
    datacontext.getAllRecipe().success((data) ->
      $scope.listRecipe = data
      return
    ).error (data, status) ->
      alert 'Error on getting all recipes', status, ' ', data
      return


    ###*************************************************************************************************###

    ###***************************************Modal Ingredient******************************************###

    ###*************************************************************************************************###

    $scope.OpenModalIngredient = ->
      modalInstance = $modal.open(
        templateUrl: 'home/ModalIngredient.html'
        controller: [
          '$scope'
          '$modalInstance'
          'datacontext'
          'toaster'
          ($scope, $modalInstance, datacontext, toaster) ->

            $scope.AddIngredient = ->
              if !$scope.titleIngredient or $scope.titleIngredient == ''
                toaster.pop 'info', 'Validation', $scope.translation.home.mainCtrl.Youneedtoenteringredientname+'!'
                return
              else
                datacontext.createIngredient title: $scope.titleIngredient
                $scope.$broadcast 'ReloadIngredient', 'Some data'
                # reinitialize attribute
                $scope.titleIngredient = ''
              return

            $scope.cancel = ->
              $modalInstance.dismiss 'cancel'
              return

            return
        ]
        size: 'sm'
        resolve: test: ->
          'test variable'
      )
      modalInstance.result.then ((selectedItem) ->
        console.log selectedItem
        return
      ), ->
      return

    ###*************************************************************************************************###

    ###***************************************Modal Recipe******************************************###

    ###*************************************************************************************************###

    $scope.OpenModalRecipe = ->
      modalInstance = $modal.open(
        templateUrl: 'home/ModalRecipe.html'
        controller: [
          '$scope'
          '$modalInstance'
          'datacontext'
          'toaster'
          '$rootScope'
          ($scope, $modalInstance, datacontext, toaster, $rootScope) ->
            #Get all ingredient
            $scope.multiselect = {}
            $scope.multiselect.ingredient = []
            datacontext.getAllIngredients().success((data) ->
              $scope.listIngredient = data
              return
            ).error (data, status) ->
              alert 'Error on getting all recipes', status, ' ', data
              return
            #Add New Recipe

            $scope.AddRecipe = ->
              if !$scope.title or $scope.title == '' or !$scope.description or $scope.description == '' or !$scope.publication_date or $scope.publication_date == ''
                toaster.pop 'info', 'Validation', $scope.translation.home.mainCtrl.Youneedtoenterallinformation
                return
              else
                datacontext.createRecipe
                  description: $scope.description
                  publication_date: $scope.publication_date
                  title: $scope.title
                  rate: 1
                $rootScope.$broadcast 'ReloadRecipe', 'Some data'
                # reinitialize attribute
                $scope.title = ''
                $scope.description = ''
                $scope.publication_date = ''
              return

            $scope.cancel = ->
              $modalInstance.dismiss 'cancel'
              return

            return
        ]
        size: 'lg')
      modalInstance.result.then ((selectedItem) ->
        console.log selectedItem
        return
      ), ->
      return

    return
]