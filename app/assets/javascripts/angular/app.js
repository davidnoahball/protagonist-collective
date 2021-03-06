angular
  .module('protag', ['spaThings.controller', 'ui.router', 'templates', 'ngMessages'])
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
          controller: 'indexController'
        })
        .state('howitworks', {
          url: '/howitworks',
          templateUrl: 'site/howitworks.html',
          controller: 'spaThingsController'
        })
        .state('adventure-index', {
          url: '/adventures',
          templateUrl: 'adventure/index.html',
          controller: 'adventureIndexController'
        })
        .state('page-new', {
          url: '/adventures/:ad_id/pages/new/:which_child/:parent_id',
          templateUrl: 'page/new.html',
          controller: 'pageNewController'
        })
        .state('page-show', {
          url: '/adventures/:ad_id/pages/:pg_id',
          templateUrl: 'page/show.html',
          controller: 'pageShowController'
        })
        .state('login', {
          url: '/login',
          templateUrl: 'user/login.html',
          controller: 'loginController'
        })
        .state('user-show', {
          url: '/users/:us_id',
          templateUrl: 'user/show.html',
          controller: 'userShowController'
        })
    }
  ]);