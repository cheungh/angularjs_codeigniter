# angularjs_codeigniter
sample app structure basic integration between AngularJS 1.x and LAMP Codeigniter 3.x. 

This project code is forked from 
https://github.com/giannidk/CodeIgniter-AngularJS-sample-app/  

## Additional Features added to the original git repo
1. Edit News or Articles  
2. Access control for Edit News  
3. Login/Logoff  
4. User / Admin feature Protected by php session backend  (could switch to JWT in front end easily)  
5. AngularJS improvement upgraded to 1.5.11 and JS code clean up  
6. Rich text editor - Angular-ui-tinymce  
7. Quick article edit for admin
8. Categories View of article  

More features will be added

## Demo site
visit www.fullstack-tutorial.com   
(Add/Edit articles is hidden apparently! it is (password protected) accessible by me to add or edit articles)  

## Improvements tips for users
Option to use cache in front end JS
See scripts/app.config.js   'USE_CACHE': true'
And cache check code in controllers

## Quick Start

Assuming LAMP stack installed on your system  
1. git clone git@github.com:cheungh/angularjs_codeigniter.git
2. Import database.sql in your database  
3. Change BASE_URL -> scripts/app/config/app.config.js (Optional. you can change to your server name or server path) 
4. Change Database user password  -> CI/application/config/database.php  
5. bower install on root project folder  
6. default username stored in database script is admin / password
7. set document root to public_html
