
angular
  .module('protag', ['spaThings.controller', 'ui.router', 'templates'])
  .config([
    '$locationProvider',
    '$stateProvider',
    function ($locationProvider, $stateProvider) {

      $locationProvider
        .html5Mode({
          enabled: true,
          requireBase: false
        });
      $stateProvider
        .state('home', {
          url: '/home',
          templateUrl: 'test.html',
          controller: 'spaThingsController'
        })
    }
  ]);