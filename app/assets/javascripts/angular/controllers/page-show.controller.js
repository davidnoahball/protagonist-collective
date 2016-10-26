function pageShowController($scope, $stateParams, pageService) {
  pageService
    .grabShowData($stateParams.ad_id, $stateParams.pg_id)
    .then(function (res) {
      $scope.page = res.data;
    });
}

angular
  .module('protag')
  .controller('pageShowController', pageShowController);