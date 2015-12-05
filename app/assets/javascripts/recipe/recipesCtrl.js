app.controller('RecipesCtrl', ['$scope','$stateParams','datacontext',
function($scope, $stateParams, datacontext){
	$scope.recipeID = $stateParams.params;

}]);