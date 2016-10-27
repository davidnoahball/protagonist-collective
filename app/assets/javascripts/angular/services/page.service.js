function pageService($http) {
  this.grabShowData = function (ad_id, pg_id) {
    return $http({
      method: 'GET',
      url: ('/adventures/' + ad_id.toString() + '/pages/' + pg_id.toString() + '.json')
    });
  };
  this.postPageData = function (ad_id, pageData) {
    return $http({
      method: 'POST',
      url: ('/adventures/' + ad_id.toString() + '/pages/new'),
      data: pageData
    });
  };

}

angular
  .module('protag')
  .service('pageService', pageService);