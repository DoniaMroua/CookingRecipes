var app=angular.module('CookingRecipe', ['ui.router', 'templates','ui.bootstrap','toaster', 'ngAnimate','ui.select','Devise']);

app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

	  $stateProvider
	    .state('home', {
	      url: '/home',
	      templateUrl: 'home/_home.html',
	      controller: 'MainCtrl'
	     
	    })
	    .state('home.recipe', {
	      url: '/home/recipe/:params',
	      templateUrl: 'recipe/_recipe.html',
	      controller: 'RecipesCtrl'
	     
	    })
	    .state('login', {
	      url: '/login',
	      templateUrl: 'auth/_login.html',
	      controller: 'AuthCtrl',
	      onEnter: ['$state', 'Auth', function($state, Auth) {
          Auth.currentUser().then(function (){
          $state.go('home');
        });
      }]
	    })
       .state('register', {
	      url: '/register',
	      templateUrl: 'auth/_register.html',
	      controller: 'AuthCtrl',
	      onEnter: ['$state', 'Auth', function($state, Auth) {
          Auth.currentUser().then(function (){
          $state.go('home');
        });
      }]
	    });
        
  $urlRouterProvider.otherwise('home');
}])

/*************************************Custom directives and filter******************************************/

.directive('datepicker', function() {
  return {
    require: 'ngModel',
    link: function(scope, el, attr, ngModel) {
      $(el).datepicker({
        onSelect: function(dateText) {
          scope.$apply(function() {
            ngModel.$setViewValue(dateText);
          });
        }
      });
    }
  };
})
.filter('cut', function () {
        return function (value, wordwise, max, tail) {
            if (!value) return '';

            max = parseInt(max, 10);
            if (!max) return value;
            if (value.length <= max) return value;

            value = value.substr(0, max);
            if (wordwise) {
                var lastspace = value.lastIndexOf(' ');
                if (lastspace != -1) {
                    value = value.substr(0, lastspace);
                }
            }

            return value + (tail || ' …');
        };
    });