angular
  .module('spaThings.controller', [])
  .controller('spaThingsController', ['$scope', function ($scope) {
    $scope.things = [
      { name: 'angular' }, { name: 'rails' }, { name: 'doing things together' }
    ];
  }]);