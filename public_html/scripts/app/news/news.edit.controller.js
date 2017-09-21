app.controller("NewsEditCtrl", ['$scope', '$state', '$stateParams', '$http', '$sce', 'APP_CONSTANTS', 'toaster', 'News', 'UserAuth', 'HeaderMeta', function ($scope, $state, $stateParams, $http, $sce, APP_CONSTANTS, toaster, News, UserAuth, HeaderMeta) {

        //angular.extend($scope, $stateParams);
        var pageTitle = "Category";
        var metaInfo = [
            {"title": pageTitle + ", " + APP_CONSTANTS.SITE_NAME},
            {"description": pageTitle + ", "  + APP_CONSTANTS.DESCRIPTION},
            {"keywords": pageTitle + ", " + APP_CONSTANTS.KEYWORDS}
        ];
        HeaderMeta.setMeta(metaInfo);
        var isEditMode = false;
        $scope.editNewsId = null;
        if ($stateParams.newId) {
            $scope.create = {};
            isEditMode = true;
            $scope.editNewsId = $stateParams.newId;
            News.getNewsById($scope.editNewsId).
                then(function(data) {
                    $scope.create.title = data.title;
                    $scope.create.intro = data.intro;
                    $scope.create.category = data.category_id,
                    $scope.create.content = data.content;
                });
        }
        var metaInfo = [
            {"title": "New, Home Page"},
            {"description": "news info"}];
        HeaderMeta.setMeta(metaInfo);
        // enable source code tool with "code"
        $scope.tinymceOptions = {
            plugins: 'link image spellchecker code paste',
            toolbar: 'undo redo | bold italic | alignleft aligncenter alignright | spellchecker | link | image | code | paste ',
            paste_as_text: true
        };
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
        
        $scope.updateHtml = function () {
            $scope.tinymceHtml = $sce.trustAsHtml($scope.create.content);
        };
        
        $scope.loadNewById = function (id) {
            $http.get(APP_CONSTANTS.BASE_URL + '/index.php/news/item/' + id).
            success(function (data, status, headers, config) {
                $scope.news = null;
                $scope.new = data;
                $scope.new.content = $sce.trustAsHtml(data.content);
            }).
            error(function (data, status, headers, config) {
                // log error
                console.log('Data is not retrieved!');
            });
        };
        
        /*
         * function support either add or edit news mode
         * 
         */
        $scope.writeNews = function () {
            var url;
            if (isEditMode) {
                url = "/index.php/news/edit";
            }
            else {
                url = "/index.php/news/create";
            } 
            $http({
                method: 'POST',
                url: url,
                data: $.param({
                    title: $scope.create.title,
                    id: $scope.editNewsId,
                    intro: $scope.create.intro,
                    category_id: $scope.create.category,
                    content: $scope.create.content
                }),
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).
            success(function (data, status, headers, config) {
                $scope.editNewsId = null;
                if (data.status) {
                    var modeMessage = (isEditMode ? "edited" : "created") ;
                    toaster.pop('success', "News added", 'Your news has been successfully ' + modeMessage, 5000);
                    //toaster.pop('error', "Your news could not be created", 'Please try again later.', 5000);
                    $state.go('news');
                    $scope.create = '';
                }
                else {
                    UserAuth.clear();
                    toaster.pop('error', (data.message  ? data.message : "Failed"), 'Failed to create news', 5000);
                    $state.go('news');
                }
            });
            console.log($scope.create);
            $scope.create.editId = null;

        };
    }]);
