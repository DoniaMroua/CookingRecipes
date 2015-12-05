app.factory('datacontext', ['$http','toaster',function($http,toaster){
	// datacontext service body
	var service = {
    recipes: [],
    ingredients:[]
    };
    
    /*******************************Query Recipes****************************************/
     
     service.getAllRecipe = function() {
    return $http.get('/recipes.json').success(function(data){
      angular.copy(data, service.recipes);
    });
    };
    
    
    service.createRecipe = function(recipe) {
  return $http.post('/recipes.json', recipe).success(function(data){
    service.recipes.push(data);
    toaster.pop('success', "Success", "Adding "+ data.title +" successfully");
   
  }).error(function(data){
    toaster.pop('error', "Error", "Error on Adding "+ recipe.title);
    });
  
};

service.updateRecipe = function(recipe) {
  return $http.put('/recipes/' + recipe.id + '.json',recipe)
    .success(function(data){
       service.recipes.push(data);
    toaster.pop('success', "Success", "Updating "+ data.title +" successfully");
   
  }).error(function(data){
    toaster.pop('error', "Error", "Error on updating "+ recipe.title);
    });
};
  

/*******************************Query Ingredients****************************************/

     service.getAllIngredients = function() {
    return $http.get('/ingredients.json').success(function(data){
      angular.copy(data, service.ingredients);
    });
  };
  
  service.createIngredient=function(ingredient) {
  return $http.post('/ingredients.json', ingredient).success(function(data){
    service.ingredients.push(data);
    toaster.pop('success', "Success", "Adding "+ data.title +" successfully");
   
  }).error(function(data){
    toaster.pop('error', "Error", "Error on Adding "+ ingredient.title);
    });
  
};
 return service;
}]); 