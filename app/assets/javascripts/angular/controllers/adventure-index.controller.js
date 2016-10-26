function adventureIndexController($scope, adventureService) {
  adventureService
    .grabIndexData()
    .then(function (res) {
      $scope.adventures = res.data;
    });

  $scope.checkboxFilter = function(adventure) { //Should abstract this later
      for(status in $scope.statusArray){
          var s = $scope.statusArray[status];
          if(s.on && adventure.statuses.indexOf(s.name) > -1){
              return true;
          }
      }
  };
  $scope.statusArray = [
    {name: "open", on: true},
    {name: "critical", on: true},
    {name: "closed", on: true}
  ]
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