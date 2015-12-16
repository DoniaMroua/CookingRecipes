@app.controller 'RecipesCtrl', ($scope, $stateParams, datacontext) ->
	$scope.recipeID = $stateParams.params