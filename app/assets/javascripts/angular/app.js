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
        .state('adventure-index', {
          url: '/adventures',
          templateUrl: 'adventure/index.html',
          controller: 'spaThingsController'
        })
        .state('adventure-new', {
          url: '/adventures/new',
          templateUrl: 'adventure/new.html',
          controller: 'spaThingsController'
        })
        .state('page-new', {
          url: '/adventures/:ad_id/pages/new',
          templateUrl: 'page/new.html',
          controller: 'spaThingsController'
        })
        .state('page-show', {
          url: '/adventures/:ad_id/pages/:pg_id',
          templateUrl: 'page/show.html',
          controller: 'spaThingsController'
        })
        .state('login', {
          url: '/login',
          templateUrl: 'user/login.html',
          controller: 'spaThingsController'
        })
        .state('user-show', {
          url: '/users/:us_id',
          templateUrl: 'user/show.html',
          controller: 'spaThingsController'
        })
    }
  ]);