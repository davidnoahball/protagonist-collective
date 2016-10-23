function bodyWrap() {
  return {
    transclude: true,
    templateUrl: 'partials/body-wrap-template.html'
  };
}
 
angular
  .module('protag')
  .directive('bodyWrap', bodyWrap);