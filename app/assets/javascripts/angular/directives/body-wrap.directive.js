function bodyWrap() {
  return {
    transclude: true,
    templateUrl: 'body-wrap-template.html'
  };
}
 
angular
  .module('protag')
  .directive('bodyWrap', bodyWrap);