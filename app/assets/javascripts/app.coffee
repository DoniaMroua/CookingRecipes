@app = angular.module('CookingRecipe', [
  'ui.router'
  'templates'
  'ui.bootstrap'
  'toaster'
  'ngAnimate'
  'ui.select'
  'Devise'
])
@app.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state('home',
      url: '/home'
      templateUrl: 'home/_home.html'
      controller: 'MainCtrl')
      
      .state('home.recipe',
      url: '/home/recipe/:params'
      templateUrl: 'recipe/_recipe.html'
      controller: 'RecipesCtrl')
      
      .state('login',
      url: '/login'
      templateUrl: 'auth/_login.html'
      controller: 'AuthCtrl'
      onEnter: [
        '$state'
        'Auth'
        ($state, Auth) ->
          Auth.currentUser().then ->
            $state.go 'home'
            return
          return
      ])
      
      .state 'register',
      url: '/register'
      templateUrl: 'auth/_register.html'
      controller: 'AuthCtrl'
      onEnter: [
        '$state'
        'Auth'
        ($state, Auth) ->
          Auth.currentUser().then ->
            $state.go 'home'
            return
          return
      ]
      
    $urlRouterProvider.otherwise 'home'
    return
]
