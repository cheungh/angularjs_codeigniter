angular.module('Config', ['ui.router', 'ngRoute'])
    .constant('APP_CONSTANTS', {
        'USE_CACHE': false,
        'BASE_URL': '',
        'JSON_DIR': '/json/',
        'SITE_NAME': 'Fullstack-Tutorial.com',
        'DESCRIPTION': 'Fullstack-Tutorial.com Demo, Tutorials on Javascript, Python, PHP, NOSQL, MYSQL',
        'KEYWORDS': 'Fullstack, Demo, Tutorials, Javascript, Python, PHP, NOSQL, MYSQL, LAMP'
    })

// ***************************** Routes and States******************************************* //
    .config(['$stateProvider', '$urlRouterProvider', '$httpProvider', '$locationProvider', function ($stateProvider, $urlRouterProvider, $httpProvider, $locationProvider) {
        // UI Routing States	
        $locationProvider.hashPrefix('!');
        $urlRouterProvider.otherwise('/home');
        $stateProvider
            .state('register', {
                url: '/register',
                templateUrl: 'views/pages/register.html'
            })
            .state('login', {
                url: '/login',
                templateUrl: 'views/pages/login.html'
            })
            .state('verify', {
                url: '/verify/{email}/{hash}',
                templateUrl: 'views/pages/home.html',
                controller: function ($scope, $stateParams, $http, toaster) {
                    $http({
                        method: 'POST',
                        url: 'index.php/user/verify',
                        data: $.param({
                            email: $stateParams.email,
                            hash: $stateParams.hash
                        }),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).
                    success(function (data, status, headers, config) {
                        if (data) {
                            console.log(data);
                            toaster.pop('success', 'Activation Successful', 'Your account is now active, visit your personal page to complete your profile', 5000, 'trustedHtml');
                        } else {
                            toaster.pop('warning', 'Activation Error!', 'No profile corresponding to the given data has been found. Please try to copy and pase the activation link in the browser address bar or try to create a new profile.', -1, 'trustedHtml');
                        }
                    });
                }
            })
            .state('home', {
                url: '/home',
                templateUrl: 'views/pages/home.html'
            })
            .state('file_upload', {
                url: '/file_upload',
                templateUrl: 'views/pages/file_upload.html'
            })
            .state('news', {
                url: '/news/:newId/:newTitle',
                templateUrl: 'views/pages/news.html'
            })
            .state('category', {
                url: '/category/:categoryId',
                templateUrl: 'views/pages/category.html'
            })
            .state('new_by_category', {
                url: '/category/:categoryName/:newId',
                templateUrl: 'views/pages/category.html'
            })
            .state('newitem', {
                url: '/newitem/:newId',
                templateUrl: 'views/pages/newitem.html'
            })
            .state('addNews', {
                url: '/addNews/:newId',
                templateUrl: 'views/pages/news-add.html'
            });
        }]);
