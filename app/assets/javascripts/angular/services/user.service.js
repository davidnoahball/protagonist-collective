function userService($http) {
  this.grabShowData = function (us_id) {
    return $http({
      method: 'GET',
      url: ('/users/' + us_id.toString() + '.json')
    });
  };
}
 
angular
  .module('protag')
  .service('userService', userService);