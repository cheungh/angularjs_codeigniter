app.controller("MenuCtrl", ['$scope', '$rootScope', '$window', 'UserAuth', 'toaster', 'News', 'APP_CONSTANTS', function ($scope, $rootScope, $window, UserAuth, toaster, News, APP_CONSTANTS) {
    $scope.leftMenuCatId = 1;
    $scope.rightMenuCatId = 2;   
    
    $scope.loadLeftMenuNews = function() {
        // load left menu item
        $scope.leftMenuNews = null;
        if (APP_CONSTANTS.USE_CACHE) {
            $scope.leftMenuNews = store.get('leftNavNewsItems');
        }
        if (_.isEmpty($scope.leftMenuNews)) {
            News.getNewsByCategoryId($scope.leftMenuCatId).
                then(function(data){
                    $scope.leftMenuNews = data; 
                    store.set('leftNavNewsItems', data);
            });
        }
    };
    
    $scope.loadRightMenuNews = function() {
        // load right menu item
        $scope.rightMenuNews = null;
        if (APP_CONSTANTS.USE_CACHE) {
            $scope.rightMenuNews = store.get('rightNavNewsItems');
        }
        if (_.isEmpty($scope.rightMenuNews)) {
            News.getNewsByCategoryId($scope.rightMenuCatId).
                then(function(data){
                    $scope.rightMenuNews = data; 
                    store.set('rightNavNewsItems', data);
            });
        }
    };
    $scope.loadLeftMenuNews();
    $scope.loadRightMenuNews();
       
}]);