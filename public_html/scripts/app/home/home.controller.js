app.controller("HomeController", ['$scope', '$state', '$stateParams', '$http', '$sce', 'APP_CONSTANTS', 'toaster', 'News', 'HeaderMeta',
    function ($scope, $state, $stateParams, $http, $sce, APP_CONSTANTS, toaster, News, HeaderMeta) {
    var metaInfo = [
        {"title": APP_CONSTANTS.SITE_NAME},
        {"description":APP_CONSTANTS.DESCRIPTION},
        {"keywords":APP_CONSTANTS.KEYWORDS}
    ];
    HeaderMeta.setMeta(metaInfo);
}]);


