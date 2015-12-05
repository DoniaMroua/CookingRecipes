app.controller('MainCtrl', [ '$scope','datacontext','$modal', function($scope,datacontext,$modal) {
 
 //init Scope variable
  $scope.max = 5;
  $scope.isReadonly = false;
  
  //Search By 
 $scope.query = {};
 $scope.queryBy='$';

 
 
//Rate, give note to recipe

  $scope.hoveringOver = function(value) {
    $scope.overStar = value;    
  };
 
 $scope.UpdateRate = function(recipe) {
    var rate=recipe.rate;
    //alert(recipe.rate);
    datacontext.updateRecipe(recipe).success(function(data){
     $scope.$broadcast('ReloadRecipe', 'Some data');
    });
    
  };
 
  
  //Refrech list after adding new recipe
  $scope.$on('ReloadRecipe', function (event, data) {
    datacontext.getAllRecipe().success(function(data){
  	$scope.listRecipe=data;
  });
  });
  
  
 //Get all recipes 
   datacontext.getAllRecipe().success(function(data){
  	$scope.listRecipe=data;
  }).error(function(data,status) {
  alert('Error on getting all recipes', status,' ' ,data);
});
  
  
  /***************************************************************************************************/
  /****************************************Modal Ingredient*******************************************/
   /***************************************************************************************************/
  
  $scope.OpenModalIngredient = function(){
  	var modalInstance = $modal.open({ 
  		templateUrl: 'home/ModalIngredient.html',
  	    controller: ['$scope', '$modalInstance', 'datacontext','toaster',
  	    function ($scope, $modalInstance, datacontext,toaster){
  	    	     $scope.AddIngredient=function(){
  	    	     	if(!$scope.titleIngredient || $scope.titleIngredient === '')  
					  { toaster.pop('info','Validation','You need to enter ingredient name!');
					  	return; }
					 else
					  {
					  	datacontext.createIngredient({
					    title: $scope.titleIngredient,
					  });
					   $scope.$broadcast('ReloadIngredient', 'Some data');
					  // reinitialize attribute
					  $scope.titleIngredient = '';
					  }
  	    	     };
	             $scope.cancel=function()
	                  {
	                  	$modalInstance.dismiss('cancel');
	                  };
        }],
  	    size: 'sm',
  	    resolve: {
        test: function () {
          return 'test variable';
        }
  	    }
  });
   modalInstance.result.then(function(selectedItem) {
          console.log(selectedItem);
        }, function() {});
};				    

/***************************************************************************************************/
/****************************************Modal Recipe*******************************************/
/***************************************************************************************************/

$scope.OpenModalRecipe = function(){
  	var modalInstance = $modal.open({ 
  		templateUrl: 'home/ModalRecipe.html',
  	    controller: ['$scope', '$modalInstance', 'datacontext','toaster','$rootScope',
  	    function ($scope, $modalInstance, datacontext,toaster,$rootScope){
  	    	
  	    	//Get all ingredient
  	    	$scope.multiselect = {};
		    $scope.multiselect.ingredient = [];
		  
  	    	datacontext.getAllIngredients().success(function(data){
  				$scope.listIngredient=data;
  			}).error(function(data,status) {
  				alert('Error on getting all recipes', status,' ' ,data);
             });
  	    	 //Add New Recipe
				  $scope.AddRecipe = function(){
				  if((!$scope.title || $scope.title === '') || (!$scope.description || $scope.description === '')|| 
				       (!$scope.publication_date || $scope.publication_date === ''))
				  { toaster.pop('info','Validation','You need to enter all information');
				  return; }
				  
				  else
				  {
				  	datacontext.createRecipe({
				    description: $scope.description,
				    publication_date: $scope.publication_date,
				    title: $scope.title,
				    rate:1
				  });
				   $rootScope.$broadcast('ReloadRecipe', 'Some data');
				  // reinitialize attribute
				  $scope.title = '';
				  $scope.description = '';
				  $scope.publication_date = '';
				  }
				  
				  };
	             $scope.cancel=function()
	                  {
	                  	$modalInstance.dismiss('cancel');
	                  };
        }],
  	    size: 'lg'
  });
   modalInstance.result.then(function(selectedItem) {
          console.log(selectedItem);
        }, function() {});
};				    


}]);