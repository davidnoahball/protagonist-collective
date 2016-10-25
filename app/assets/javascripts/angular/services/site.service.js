function siteService($http) {
  this.grabIndexData = function () {
    return $http({
      method: 'GET',
      url: '/index.json'
    });
  };
}

angular
  .module('protag')
  .service('siteService', siteService);