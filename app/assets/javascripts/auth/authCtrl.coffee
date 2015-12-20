<<<<<<< HEAD
app.controller 'AuthCtrl', [
  '$scope'
  '$state'
  'Auth'
  ($scope, $state, Auth) ->
  
 #Registration and Login
    $scope.login = ->
      Auth.login($scope.user).then ->
        $state.go 'home'
        return
      return

    $scope.register = ->
      Auth.register($scope.user).then ->
        $state.go 'home'
        return
      return

    return
=======
app.controller 'AuthCtrl', [
  '$scope'
  '$state'
  'Auth'
  ($scope, $state, Auth) ->
  
    # registration and login
    
    $scope.login = ->
      Auth.login($scope.user).then ->
        $state.go 'home'
        return
      return

    $scope.register = ->
      Auth.register($scope.user).then ->
        $state.go 'home'
        return
      return

    return
>>>>>>> 218d6ef0196ad0d6821d9278f7cb7e219cda7069
]