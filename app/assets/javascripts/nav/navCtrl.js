app.controller('NavCtrl', ['$scope','Auth', function($scope, Auth){
	
  // Expose the isAuthenticated method and logout method to $scope
  $scope.signedIn = Auth.isAuthenticated;
  $scope.logout = Auth.logout;
  
  //Try to access Auth.currentUser() to set $scope.user when the controller loads
  Auth.currentUser().then(function (user){
    $scope.user = user;
  });
  
  
  //Add Event listeners to handle when the user authenticates and logs out
  $scope.$on('devise:new-registration', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:login', function (e, user){
    $scope.user = user;
  });

  $scope.$on('devise:logout', function (e, user){
    $scope.user = {};
  });

}]);