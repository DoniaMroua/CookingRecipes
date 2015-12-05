app.controller('AuthCtrl', ['$scope','$state','Auth', function($scope, $state, Auth){
	
	
	//Registration and Login
	$scope.login = function() {
    Auth.login($scope.user).then(function(){
      $state.go('home');
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $state.go('home');
    });
  };
}]);