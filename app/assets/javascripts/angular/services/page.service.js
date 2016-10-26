function pageService($http) {
  this.grabShowData = function (ad_id, pg_id) {
    return $http({
      method: 'GET',
      url: ('/adventures/' + ad_id.toString() + '/pages/' + pg_id.toString() + '.json')
    });
  };
}

angular
  .module('protag')
  .service('pageService', pageService);