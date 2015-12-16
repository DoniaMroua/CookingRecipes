app.factory 'datacontext', [
  '$http'
  'toaster'
  ($http, toaster) ->
  
    # datacontext service body
    
    service = 
      recipes: []
      ingredients: []

    ###******************************Query Recipes***************************************###

    service.getAllRecipe = ->
      $http.get('/recipes.json').success (data) ->
        angular.copy data, service.recipes
        return

    service.createRecipe = (recipe) ->
      $http.post('/recipes.json', recipe).success((data) ->
        service.recipes.push data
        toaster.pop 'success', 'Success', 'Adding ' + data.title + ' successfully'
        return
      ).error (data) ->
        toaster.pop 'error', 'Error', 'Error on Adding ' + recipe.title
        return


    service.updateRecipe = (recipe) ->
      $http.put('/recipes/' + recipe.id + '.json', recipe).success((data) ->
        service.recipes.push data
        toaster.pop 'success', 'Success', 'Updating ' + recipe.title + ' successfully'
        return
      ).error (data) ->
        toaster.pop 'error', 'Error', 'Error on updating ' + recipe.title
        return
        

    ###******************************Query Ingredients***************************************###

    service.getAllIngredients = ->
      $http.get('/ingredients.json').success (data) ->
        angular.copy data, service.ingredients
        return


    service.createIngredient = (ingredient) ->
      $http.post('/ingredients.json', ingredient).success((data) ->
        service.ingredients.push data
        toaster.pop 'success', 'Success', 'Adding ' + data.title + ' successfully'
        return
      ).error (data) ->
        toaster.pop 'error', 'Error', 'Error on Adding ' + ingredient.title
        return

    service
]
