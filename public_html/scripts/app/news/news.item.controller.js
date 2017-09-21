app.controller("NewItemCtrl", ['$scope', '$state', '$stateParams', '$http', function ($scope, $stateParams, $http) {
    angular.extend($scope, $stateParams);
}]);