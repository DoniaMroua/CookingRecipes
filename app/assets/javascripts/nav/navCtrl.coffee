@app.controller 'NavCtrl', ($scope, Auth) ->
	
  # Expose the isAuthenticated method and logout method to $scope
  $scope.signedIn = Auth.isAuthenticated
  $scope.logout = Auth.logout
  
  #Try to access Auth.currentUser() to set $scope.user when the controller loads
  Auth.currentUser().then (user) ->
    $scope.user = user
 
  
  
  #Add Event listeners to handle when the user authenticates and logs out
  $scope.$on 'devise:new-registration', (e, user) ->
    $scope.user = user
  

  $scope.$on 'devise:login', (e, user) ->
    $scope.user = user
  

  $scope.$on 'devise:logout', (e, user) ->
    $scope.user = {}
  