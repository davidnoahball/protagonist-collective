function indexController($scope, siteService) {
  siteService
    .grabIndexData()
    .then(function (res) {
      $scope.stats = res.data;
    });
}

angular
  .module('protag')
  .controller('indexController', indexController);