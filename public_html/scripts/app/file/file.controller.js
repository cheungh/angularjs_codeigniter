app.controller("fileUploadCtrl", ['$scope', '$state', '$stateParams', '$http', '$sce', 'APP_CONSTANTS', 
    'toaster', 'News', 'UserAuth', 'HeaderMeta', 'Upload', '$timeout', 
    function ($scope, $state, $stateParams, $http, $sce, APP_CONSTANTS, toaster, News, UserAuth, HeaderMeta, Upload, $timeout) {

    $scope.message = "hello";
    $scope.uploadPic = function(file) {
        file.upload = Upload.upload({
          url: 'http://localhost/upload.php',
          data: {username: $scope.username, file: file},
        });

        file.upload.then(function (response) {
          $timeout(function () {
            file.result = response.data;
          });
        }, function (response) {
          if (response.status > 0)
            $scope.errorMsg = response.status + ': ' + response.data;
        }, function (evt) {
          // Math.min is to fix IE which reports 200% sometimes
          file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
        });
    }

}]);