app.factory('News', function($http, $q, APP_CONSTANTS){
	
    return {
	getCategory: function(){ 
            var deferred = $q.defer();
            $http.get('/category', {

            }).success(function(data) {
                if (data) {
                    deferred.resolve(data);
                    return;
                }
                deferred.reject();
            });
            return deferred.promise;
        },
        getNewsByCategoryId: function(catId){ 
            var deferred = $q.defer();
            $http.get('/category/get_news', {
                params: {cat_id: catId}
            }).success(function(data) {
                if (data) {
                    deferred.resolve(data);
                    return;
                }
                deferred.reject();
            });
            return deferred.promise;
        },
        getNewsById: function(newId){ 
            var deferred = $q.defer();
            $http.get(APP_CONSTANTS.BASE_URL + '/index.php/news/item/' + newId, {
            }).success(function(data) {
                if (data) {
                    deferred.resolve(data);
                    return;
                }
                deferred.reject();
            });
            return deferred.promise;
        },
        getAllNews: function(){ 
            var deferred = $q.defer();
            $http.get(APP_CONSTANTS.BASE_URL + '/index.php/news/view', {
            }).success(function(data) {
                if (data) {
                    deferred.resolve(data);
                    return;
                }
                deferred.reject();
            });
            return deferred.promise;
        }
    };
});