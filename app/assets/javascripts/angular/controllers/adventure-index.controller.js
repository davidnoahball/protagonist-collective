function adventureIndexController($scope, adventureService) {
  adventureService
    .grabIndexData()
    .then(function (res) {
      $scope.adventures = res.data;
    });

}

angular
  .module('protag')
  .controller('adventureIndexController', adventureIndexController);

/*
[
  {"title":"The dummy adventure", "page_count":4, "critical_size":16, "root":1, "id":1},
  {"title":"The dummy adventure", "page_count":4, "critical_size":16, "root":1, "id":1}
]
*/