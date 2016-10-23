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
        .state('index', {
          url: '/',
          templateUrl: 'site/index.html',
          controller: 'spaThingsController'
        })
        .state('howitworks', {
          url: '/howitworks',
          templateUrl: 'site/howitworks.html',
          controller: 'spaThingsController'
        })
    }
  ]);