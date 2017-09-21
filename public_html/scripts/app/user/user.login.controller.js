app.controller("UserLoginController", ['$scope', '$http', '$window', 'UserAuth', 'toaster',
    function ($scope, $http, $window, UserAuth, toaster) {

        $scope.login = function () {
            $scope.waiting = true;
            /*
            $http.post('index.php/user/login', {
                params: {
                    email: $scope.username,
                    password: $scope.password
                }
            })*/
           $http({
			method: 'POST',
			url: '/index.php/user/login',
			data: $.param({
				username: $scope.username,
				password: $scope.password
			}),
			headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		})
                 .success(function (data) {
                $scope.waiting = false;
                if (data.status) {
                    UserAuth.initialize(data);
                    $window.location.href = '/';

                } else {
                    toaster.pop('error', "Login Failed", 'Login failed. Please retry.', 5000);

                }
            });
        };
    }]);