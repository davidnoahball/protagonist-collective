//= require angular
//= require angular-ui-router
//= require_tree .

angular.module('spaThings', ['spaThings.controller'])
  .config([
    '$httpProvider',
    '$locationProvider',
  function ($httpProvider, $locationProvider) {

    // Send CSRF token with every http request
    $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=csrf-token]").attr("content");

    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    });

  }]);

//put UI-Router code here