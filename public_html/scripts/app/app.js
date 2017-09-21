var app = angular.module('memberssite', ['ngAnimate', 'toaster', 'Config', 'Directives', 'ui.tinymce', 'rt.encodeuri'], function () {


    //console.log('Angular loaded');

})
        .run(function ($rootScope) {
            $rootScope.meta = {};
            //$rootScope.meta.title = "my test";
        }

        )

        .controller('appController', function ($scope) {

        });




