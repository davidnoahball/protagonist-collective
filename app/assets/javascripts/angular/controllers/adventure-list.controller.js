function adventureListController($scope) {
  $scope.adventures = [
    {"title":"The dummy adventure", "page_count":4, "critical_size":16, "root":1, "id":1},
    {"title":"The dummy adventure", "page_count":4, "critical_size":16, "root":1, "id":1}
  ];
}
 
angular
  .module('protag')
  .controller('adventureListController', adventureListController);