app.factory('UserAuth', function($q, $http) {
    return {
        clear: function() {
            store.set('user', {});
            $http.get('/user/logout').
                success(function (data, status, headers, config) {
                    return data;
                }).
                error(function (data, status, headers, config) {
                    // log error
                    console.log('error');
                });
        },
        permissions: function(resource) {
            var deferred = $q.defer();
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            $http.post('api/user/permissions', {
                token: user.token,
                resource: resource
            }).success(function(data) {
                if (data.status) {
                    deferred.resolve(data.permissions);
                    return;
                }
                deferred.reject();
            });
            return deferred.promise;
        },
        initialize: function (userReponse) {
            store.set('user', {});
            //var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            //user.email = email;
            store.set('user', userReponse);
        },
        loggedIn: function() {
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            return !_.isEmpty(user) && !_.isEmpty(user.token) && !_.isUndefined(user.token);
        },
        getEmail: function() {
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            return user.email;
        },
        isLoggedIn: function() {
            if (_.isEmpty(store.get('user'))) {
                return false;
            }
            return true;
        },
        getRole: function() {
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            if (user) {
                return user.role;
            }
        },
        getToken: function() {
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            return user.token;
        },
        setEmail: function(email) {
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            user.email = email;
            store.set('user', user);
        },
        setToken: function(token) {
            var user = _.isUndefined(store.get('user')) ? {} : store.get('user');
            user.token = token;
            store.set('user', user);
        }
    };
});