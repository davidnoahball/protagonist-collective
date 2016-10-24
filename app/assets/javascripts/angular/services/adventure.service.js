function adventureService($http) {
  this.grabIndexData = function (message) {
    return $http({
      method: 'GET',
      url: '/adventures.json'
    });
  };
}
 
angular
  .module('protag')
  .service('adventureService', adventureService);