//= require angular
//= require angular-ui-router
//= require_tree .

angular
  .module('spaThings', ['spaThings.controller', 'ui.router'])
  .config([
    '$locationProvider',
    '$stateProvider',
    function ($locationProvider, $stateProvider) {

      $locationProvider
        .html5Mode({
          enabled: true,
          requireBase: false
        });
///*
      $stateProvider
        .state('test', {
          url: '/',
          templateUrl: '../../views/spa_things/index.html.erb',
          controller: 'spaThingsController'
        })
//*/
    }
  ]);

//put UI-Router code here