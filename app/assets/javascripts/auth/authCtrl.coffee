<<<<<<< HEAD
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
>>>>>>> c19a0afb88317aa45580608b73865ed598dac6ec
]