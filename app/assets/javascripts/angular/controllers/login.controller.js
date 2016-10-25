function loginController($scope, $state) {
  $scope.clickMe = function() { //I didn't end up using this, but I'm keeping it here for reference.
    $state.reload();
  };
}

angular
  .module('protag')
  .controller('loginController', loginController);