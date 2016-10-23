function secondHeader() {
  return {
    transclude: true,
    templateUrl: 'partials/second-header-template.html'
  };
}
function secondHeaderRight() {
  return {
    transclude: true,
    template: '<div class="secondary-right"><span ng-transclude></span></div>'
  };
}
function secondHeaderCenter() {
  return {
    transclude: true,
    template: '<div class="secondary-center"><span ng-transclude></span></div>'
  };
}
function secondHeaderLeft() {
  return {
    transclude: true,
    template: '<div class="secondary-left"><span ng-transclude></span></div>'
  };
}
 
angular
  .module('protag')
  .directive('secondHeader', secondHeader)

angular
  .module('protag')
  .directive('secondHeaderRight', secondHeaderRight);

angular
  .module('protag')
  .directive('secondHeaderCenter', secondHeaderCenter);

angular
  .module('protag')
  .directive('secondHeaderLeft', secondHeaderLeft);