//app.controller("CategoryCtrl", ['$scope', '$state', '$stateParams', '$http', APP_CONSTANTS', 'toaster', 'News', function ($scope, $state, $stateParams, $http, $sce, APP_CONSTANTS, toaster, News) {
app.controller("CategoryCtrl", ['$scope', '$state', '$stateParams', '$http', '$sce', 'APP_CONSTANTS', 'toaster', 'News', 'UserAuth', 'HeaderMeta', function ($scope, $state, $stateParams, $http, $sce, APP_CONSTANTS, toaster, News, UserAuth, HeaderMeta) {

    //angular.extend($scope, $stateParams);
    $scope.myNews = [];
    $scope.news_by_category = null;
    // $scope.categories = null; 
    
    $scope.loadCategory = function() {
        $scope.news_by_category = null;
        $scope.isAllCategory = true;
        $scope.isOneCategory = false;
        $scope.isOneNews = false;
        
        News.getCategory()
            .then(function(data) {
                $scope.categories = data;
                console.log(data);
                /*if ($stateParams.newId) {
                    $scope.loadNewsByNewsId();
                }
                else if ($stateParams.categoryId) { // categoryId
                    $scope.loadNewByCatId($stateParams.catgoryId);
                }
                else {
                    $scope.isAllCategory = true;
                }*/
        });
    };
    
    $scope.getCategoryNameById = function(catId) {
        for(var i = 0; i < $scope.categories.length; i++) {
            console.log("id is " + $scope.categories[i].id);
            if ($scope.categories[i].id === catId) {
                console.log("cat name is " + $scope.categories[i].category_name);
                return $scope.categories[i].category_name;
            }
        }
    };
    
    $scope.loadNewByCatId = function(catId) {
        $scope.isOneCategory = true;
        $scope.isAllCategory = false;
        $scope.isOneNews = false;
        
        
        $scope.currentCatId = catId;
        // $scope.currentCategoryName = $scope.getCategoryNameById(catId);
        // $scope.categories = null;
        News.getNewsByCategoryId(catId).
            then(function(data){
                $scope.news_by_category = data;
        });
    };
    
    /** load new by newId **
     * example to pass param oto state
     * @param {type} newId
     */
    $scope.loadCategoryNewsByNewId = function (categoryName, newId) {
        //$state.go('news',{newId: newId});
        //   url: '/category/:categoryName/:newId',
        $state.go('new_by_category',{categoryName: categoryName, newId: newId});
    };
    
    $scope.loadNewsByNewsId = function(newId) {
        News.getNewsById($stateParams.newId).
        then(function(data) {
            $scope.categoryName = $stateParams.categoryName;
            $scope.news = null;
            $scope.new = data;
            $scope.new.content = $sce.trustAsHtml(data.content);
        });
    };
    
    // READ NEWS JSON FILE THROUGH CODEIGNITER
    $scope.loadCategory();
    
    if ($stateParams.newId) {
        $scope.isAllCategory = false;
        $scope.isOneCategory = false;
        $scope.isOneNews = true;
        $scope.loadNewsByNewsId();
    }
    else if ($stateParams.categoryId) { // categoryId
        $scope.loadNewByCatId($stateParams.categoryId);
    }
    else {
        /*$scope.isAllCategory = true;
        $scope.isOneCategory = false;
        $scope.isOneNews = false;*/
    }
    


    



}]);
