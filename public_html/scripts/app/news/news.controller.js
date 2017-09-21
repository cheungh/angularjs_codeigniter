app.controller("NewsCtrl", ['$scope', '$state', '$stateParams', '$http', '$sce', 'APP_CONSTANTS', 'toaster', 'News', 'UserAuth', 'HeaderMeta', function ($scope, $state, $stateParams, $http, $sce, APP_CONSTANTS, toaster, News, UserAuth, HeaderMeta) {

        //angular.extend($scope, $stateParams);
        $scope.myNews = [];
        var pageTitle = "News";
        // loadNewByAll
        var metaInfo = [
            {"title": pageTitle + ", " + APP_CONSTANTS.SITE_NAME},
            {"description": pageTitle + ", "  + APP_CONSTANTS.DESCRIPTION},
            {"keywords": pageTitle + ", " + APP_CONSTANTS.KEYWORDS}
        ];
        HeaderMeta.setMeta(metaInfo);
        
        // enable source code tool with "code"
        if (_.isEmpty($scope.categoryOptions)) {
            News.getCategory()
                    .then(function (data) {
                        $scope.categoryOptions = data;
                        //console.log(data);
                    });
        }
        //$scope.categoryOptions = News.getCategory();
        if (UserAuth.getRole() === 1) {
            $scope.isAdmin = true;
        }

        $scope.loadAllNews = function () {
            News.getAllNews().
                then(function(data) {
                    $scope.new = null;
                    $scope.news = data;
                    $scope.loading = false;
                });
        };

        $scope.editNews = function (newId) {
            $state.go('addNews',{newId: newId});
        };
        // getAllNews
        if (!$stateParams.newId) {
            $scope.loadAllNews();
        }
        else {
            // load individual by newId
            News.getNewsById($stateParams.newId).
                then(function(data) {
                    $scope.news = null;
                    $scope.new = data;
                    $scope.new.content = $sce.trustAsHtml(data.content);
                });
        }

    }]);