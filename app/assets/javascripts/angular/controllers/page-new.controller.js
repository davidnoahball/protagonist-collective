function pageNewController($scope, $stateParams, $state, pageService) {
  $scope.submitData = function() {
    pageService
      .postPageData($stateParams.ad_id, $scope.pageData)
      .then(function (res) {
        $state.go('page-show', {ad_id: $stateParams.ad_id, pg_id: res.data}, {reload: true});
      });
  };
  $scope.pageData = {
    "utf8": "✓", //hard-set
    "commit": "submit", //hard-set
    "adventure_id": $stateParams.ad_id, //comes from url
    "page": {
      "adventure_id": $stateParams.ad_id, //comes from url
      "parent_id": $stateParams.parent_id, //comes from url
      "user_id": "", //changed in backend controller
      "body": "thlejrg lkaj rglkjhaelkrjghl akjerhg klajeh rgklja eklrjghekajrhg klajhrgk jahe rgkjha elkrjgh lkaje lrkgjh alkejhr glkajherlkgj alekjrghlae", //input
      "end": "", //input
      "choice1": "flkjaherlkfja elrgkjhaer", //input
      "choice2": "kjhlekrgjha lrkejagh", //input
      "which_child": $stateParams.which_child //comes from url
    }
  };
}

angular
  .module('protag')
  .controller('pageNewController', pageNewController);