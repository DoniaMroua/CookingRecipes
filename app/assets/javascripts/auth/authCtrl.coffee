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
]