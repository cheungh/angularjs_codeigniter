app.service('HeaderMeta', function ($rootScope) {
    return {
        setMeta: function (metaPairs) {
            angular.forEach(metaPairs, function (data) {
                angular.forEach(Object.keys(data), function (key) {
                    $rootScope.meta[key] = data[key];
                });
            });
        }
    };
});

