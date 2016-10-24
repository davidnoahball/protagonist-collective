function userShowController($scope, $stateParams, userService) {
  userService
    .grabShowData($stateParams.us_id)
    .then(function (res) {
      $scope.user = res.data;
    });
}

angular
  .module('protag')
  .controller('userShowController', userShowController);