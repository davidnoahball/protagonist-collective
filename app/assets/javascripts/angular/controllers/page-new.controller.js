function pageNewController($scope, $stateParams, pageService) {
  $scope.submitData = function() {
    pageService
      .postPageData($stateParams.ad_id, $scope.pageData)
  };
  $scope.pageData = {
    "utf8": "✓",
    "commit": "submit",
    "adventure_id": "1",
    "page": {
      "adventure_id": "1",
      "parent_id": "1",
      "user_id": "2",
      "body": "thlejrg lkaj rglkjhaelkrjghl akjerhg klajeh rgklja eklrjghekajrhg klajhrgk jahe rgkjha elkrjgh lkaje lrkgjh alkejhr glkajherlkgj alekjrghlae",
      "end": "",
      "choice1": "flkjaherlkfja elrgkjhaer",
      "choice2": "kjhlekrgjha lrkejagh",
      "which_child": $stateParams.which_child
    }
  };
}

angular
  .module('protag')
  .controller('pageNewController', pageNewController);