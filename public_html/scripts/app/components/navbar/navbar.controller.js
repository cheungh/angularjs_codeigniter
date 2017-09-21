app.controller("NavbarCtrl", ['$scope', '$window', 'UserAuth', 'toaster', function ($scope, $window, UserAuth, toaster) {
    var isLoggin = UserAuth.isLoggedIn();
    $scope.isLogin = isLoggin;
    $scope.logout = function () {
        data = UserAuth.clear();
        toaster.pop('success', "Logout", "successfully logout", 2000);

        $scope.isLogin = false;
        $window.location.href = '/';
    };
}]);