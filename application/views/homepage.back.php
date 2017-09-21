<!DOCTYPE html>
<html lang="en" ng-app="memberssite">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Members Site</title>

  	<!-- Toaster -->
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/angularjs-toaster/0.4.16/toaster.min.css" rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  
  
  </head>
  <body data-grid-framework="b3f" data-grid-color="blue" data-grid-opacity="0.2" data-grid-zindex="999999" data-grid-gutterwidth="20px" data-grid-nbcols="16" ng-controller="appController">
  
<navbar></navbar>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <div ui-view autoscroll="false"></div>
  </div>
<!-- /.content-wrapper -->

<footer-template></footer-template>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="scripts/vendor/bootstrap/bootstrap.min.js"></script>   

<!-- AnglarJs -->
<script src="scripts/vendor/angular/angular.min.js"></script>
<script src="https://code.angularjs.org/1.4.7/angular-animate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angularjs-toaster/0.4.16/toaster.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.2.13/angular-ui-router.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/store.js/1.3.14/store.min.js"></script>
<script src="scripts/app/app.js"></script>
<script src="scripts/app/config/app.config.js"></script>
<script src="scripts/app/config/app.directives.js"></script>
<script src="scripts/app/user/user.controller.js"></script>
<script src="scripts/app/news/news.item.controller.js"></script>
<script src="scripts/app/user/user.service.js"></script>
<script src="scripts/app/user/user.auth.service.js"></script>
<script src="scripts/app/news/news.controller.js"></script>
<script src="scripts/app/news/news.service.js"></script>

<toaster-container toaster-options="{'time-out': 3000, 'close-button':true, 'animation-class': 'toast-top-center'}"></toaster-container>
</body>
</html>