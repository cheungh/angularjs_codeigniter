-- MySQL dump 10.14  Distrib 5.5.56-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: angjs_ci
-- ------------------------------------------------------
-- Server version	5.5.56-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `angjs_ci`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `angjs_ci` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `angjs_ci`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'PHP',''),(2,'Python',''),(3,'AngularJS',''),(4,'MYSQL',''),(5,'Linux',''),(6,'MongoDb','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `intro` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (72,'PHP Simple XML','PHP build-in libraray SimpleXML offers another alternative to handle the XML as PHP array objects which can be easily accessed and iterated. SimpleXML','<p><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">PHP build-in libraray SimpleXML offers another alternative to handle the XML as PHP array objects which can be easily accessed and iterated. SimpleXML also have a very handy XPath function to search for element items.</span><br style=\"font-family: Arial, Helvetica, sans-serif; font-size: 13px;\" /><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">E.g. In our example, we use xpath to load all the book titles. $xpath_search_titles = $books-&gt;xpath(\'book/title\');</span><br style=\"font-family: Arial, Helvetica, sans-serif; font-size: 13px;\" /><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 13px;\">Traditional ways are DOM and SAX parsing.</span></p>\n<pre><code>\n#### Listing 1.1 ####\n&lt;?php\n### the xml string for the book items\n$xml_str = \n\'&lt;?xml version=\"1.0\" encoding=\"ISO-8859-1\"?&gt;\n&lt;books&gt;\n	&lt;book id=\"1\"&gt;\n		&lt;pub_date&gt;2009-05-01&lt;/pub_date&gt;\n		&lt;author&gt;Php Code Warrior&lt;/author&gt;\n		&lt;title&gt;PHP Design Pattern&lt;/title&gt;\n		&lt;page_cnt&gt;531&lt;/page_cnt&gt;\n		&lt;desc&gt;Design Pattern in PHP&lt;/desc&gt;\n		&lt;isbn&gt;123456789&lt;/isbn&gt;\n	&lt;/book&gt;\n	&lt;book id=\"2\"&gt;\n		&lt;pub_date&gt;2009-10-01&lt;/pub_date&gt;\n		&lt;author&gt;Great PHP freak&lt;/author&gt;\n		&lt;title&gt;PHP Core App&lt;/title&gt;\n		&lt;page_cnt&gt;234&lt;/page_cnt&gt;\n		&lt;desc&gt;A Great PHP book&lt;/desc&gt;\n		&lt;isbn&gt;7678665656&lt;/isbn&gt;\n	&lt;/book&gt;\n	&lt;book id=\"3\"&gt;\n		&lt;pub_date&gt;2009-08-01&lt;/pub_date&gt;\n		&lt;author&gt;Just Hack&lt;/author&gt;\n		&lt;title&gt;PHP Hacking App&lt;/title&gt;\n		&lt;page_cnt&gt;331&lt;/page_cnt&gt;\n		&lt;desc&gt;Tips and Hacks&lt;/desc&gt;\n		&lt;isbn&gt;3344498989&lt;/isbn&gt;\n	&lt;/book&gt;\n&lt;/books&gt;\n\';\n\n### the code\n### load the xml string into PHP \n### a simpleXML object\n$books = simplexml_load_string($xml_str);\n\n// to view the data structure\nvar_dump($books);\n\n// to access an individual element\nvar_dump($books[1]);\n\n// to access an element textnode\n// the 2nd book\'s title\nvar_dump($books-&gt;book[1]-&gt;title);\n\n// to access the attribute\nvar_dump($books-&gt;book[1][\'id\']);\n\n// to loop thru each book\n// we add a counter to show\n$counter = 1;\nforeach($books as $book) {\n	\n	echo \"Item: \". $counter . \"\\n\";\n	// get attribute using array\n	// can be done thru $book-&gt;attributes();\n	// var_dump($book-&gt;attributes());\n	echo \"id :: \" . $book[\'id\'] . \"\\n\";\n	\n	// loop thru each element key and value\n	foreach($book as $key =&gt; $value) {\n		echo $key . \" :: \" . (String)$value .\"\\n\";\n	}\n	$counter++;\n}\n\n// using xpath to seach all the book title\necho \"result from using xpath\\n\";\n$xpath_search_titles = $books-&gt;xpath(\'book/title\');\nforeach($xpath_search_titles as $index =&gt; $title) {\n	echo $index . \" :: \" . (String)$title .\"\\n\";\n}\n\n?&gt;\n</code></pre>','php-simple-xml','',1),(73,'Python MySQLdb Tutorial','Code Example to use MySQLdb','<p>Code Example to use MySQLdb</p>\n<pre><code>\nimport MySQLdb\nfrom ConfigParser import ConfigParser\n\nimport inspect\n\n\ndef get_db_connect(namespace):\n\n    global fatal_exception_counter, db_instances\n    conf = ConfigParser()\n    conf.read(\"./db.ini\")\n    \"\"\" contents from db.ini file\n[LOCAL_DB]\nhost = 127.0.0.1\nport = 3306\ncatalogue = testdb\nusername = root\npassword = abcd\n    \"\"\"\n    dbCursor = None\n    try:\n        db = MySQLdb.connect(\n        host = conf.get(namespace, \'host\'),\n        user = conf.get(namespace, \'username\'),\n        port = conf.getint(namespace, \'port\'),\n        passwd = conf.get(namespace, \'password\'),\n        db = conf.get(namespace, \'catalogue\'))\n        dbCursor = db.cursor(MySQLdb.cursors.DictCursor)\n\n    except Exception:\n        print (inspect.stack()[0][3])\n        raise\n\n    return dbCursor\n\ndef main():\n    ### fetching from guestbook table\n    table = \"Gustbook\"\n    CDSDBCursor = get_db_connect(\'yourdatabase\')\n    statement = \"\"\"SELECT * FROM %s limit 10\"\"\" %(table)\n    print statement\n    # sys.exit(1)\n    command = CDSDBCursor.execute(statement)\n    results = CDSDBCursor.fetchall()\n\n    print \"=========== START ===========\"\n    for row in results :\n        for field in row :\n            print \"%s\\t\\t%s\" %(field, row[field])\n            #sys.exit(1)\n    print \"=========== DONE ===========\"\n\nif __name__ == \'__main__\':\n    main()\n\n</code></pre>','python-mysqldb-tutorial','',2),(74,'How to add Tinymce to AngularJS','Add Tinymce to AngularJS','<p>How to include Tinymce to AngularJS Project</p>\n<pre><code>\n\n// bower install\nbower install --save angular-ui-tinymce\n\n// injection\nvar app = angular.module(\'app\', [\'ui.tinymce\'], function () {\n\n\n// controller code\n\n        $scope.tinymceOptions = {\n            plugins: \'link image spellchecker code\',\n            toolbar: \'undo redo | bold italic | alignleft aligncenter alignright | spellchecker | link | image | code\'\n        };\n\n// view code\n\n&lt;textarea \nng-change=\"updateHtml()\" \nui-tinymce=\"tinymceOptions\" \nclass=\"form-control\" \nrows=\"5\" \nid=\"content\" \nng-model=\"create.content\" \nrequired&gt;\n&lt;/textarea&gt;\n\n\n</code></pre>','how-to-add-tinymce-to-angularjs','',3),(76,'Howto Password-less SSH Login','Howto Password-less SSH Login','<p>If you are navigating many servers, it\'s convenient to be able to login to remote servers without entering your password each time. You could do this via public key-based authentication with SSH. On your local linux box (node1 in my case), first create a public/private key pair:</p>\n<pre><code>\nlampdev@node1:~$ ssh-keygen\nGenerating public/private rsa key pair.\nEnter file in which to save the key (/home/lampdev/.ssh/id_rsa):\nEnter passphrase (empty for no passphrase):\nEnter same passphrase again:\nThe private key of node1 has been saved in /home/lampdev/.ssh/id_rsa.\nThe public key has been saved in /home/lampdev/.ssh/id_rsa.pub.\nThe key fingerprint is:\n[some hex number hash on your linux box] lampdev@node1\n\n# use \"ls\" to list the files in the .ssh folder\nlampdev@node1:~$ ls .ssh\nid_rsa id_rsa.keystore id_rsa.pub known_hosts\nid_rsa is your private key, and id_rsa.pub is your public key.\n# Copy the public key over to the remote host (\"server01\" in this case):\n\nlampdev@node1:~$ ssh-copy-id -i .ssh/id_rsa.pub lampdev@server01 \n#(The command prompt will ask for your password on server01 (in my case)	 \n\n</code></pre>','howto-password-less-ssh-login','',5),(77,'MYSQL grant howto','Creating MYSQL user account with password and privileges','<pre><code>\n### creating user account example \n### without using encryption password\n### with a ip range for subnet of 67.101.23.*\nCREATE USER \'steve\'@\'67.101.23.%\' IDENTIFIED BY \'testpass\';\n\n### creating user account example \n### using encryption password\n### first get the password from mysql\nmysql&gt; select password(\'testpass\');\n+-------------------------------------------+\n| password(\'testpass\')                      |\n+-------------------------------------------+\n| *00E247AC5F9AF26AE0194B41E1E769DEE1429A29 | \n+-------------------------------------------+\n1 row in set (0.00 sec)\n\n### now create the user with encrypted password\nCREATE USER \'steve\'@\'67.101.23.%\' \nIDENTIFIED BY password \'*00E247AC5F9AF26AE0194B41E1E769DEE1429A29\';\n\n### example of a specified IP addr 67.101.23.111\nCREATE USER \'steve\'@\'67.101.23.111\' \nIDENTIFIED BY \'*00E247AC5F9AF26AE0194B41E1E769DEE1429A29\';\n\n### allowing read, update, write access \n### to database products to steve on ip of 67.101.23.111\nGRANT ALL PRIVILEGES ON products.* TO \'steve\'@\'67.101.23.111\';\n\n### must run the following command \n### to take effect immediately\nFLUSH PRIVILEGES;\n\n</code></pre>','mysql-grant-howto','',4),(78,'Multiple MYSQL database instances database setup tutorial','Multiple MYSQL database instances database setup tutorial','<p>Multiple MYSQL database instances database setup tutorial<br />Tutorial objective:<br />At the end of the tutorial, you should be able to:<br />Set up multiple MYSQL database instances running on a server.</p>\n<p>The tutorial will come with working examples and explanation on howto setup multiple MYSQL database instances on a LINUX/UNIX OS.</p>\n<p>Tutorial outline:</p>\n<p>Install individual MYSQL database instance<br />Set up database user on all the database instances<br />Basic Configuration to manage MYSQL database instances<br />How to start/shutdown MYSQL database instance<br />How to connect to individual MYSQL database instance<br />Testing Example on individual instance to verify the multiple MYSQL database instance is successful.<br />&nbsp;</p>\n<p>&nbsp;</p>\n<p>Let us answer this question, why bother to use run multiple MYSQL database instances on the same server? The reasons could be different based on user\'s need. To name a few:</p>\n<p>Testing or educational purpose<br />Isolating Database for portability<br />Running a master/slave replication for backup database purpose<br />&nbsp;</p>\n<p>Step one: Install multiple MYSQL database instance. Apparently, you are required to set up multiple MYSQL database servers on the LINUX server.<br />First, if MYSQL database server is not installed on the server. You need to install the MYSQL database server software package. The easier way is to install it through YUM. Please refer on my&nbsp;MYSQL server YUM INSTALLATION tutorial. You can also install MYSQL database server via the MYSQL BINARY. See my&nbsp;MYSQL server installation from MYSQL database BINARY softward tutorial.</p>\n<p>&nbsp;</p>\n<p>Setting up the first MYSQL instance.<br />In this tutorial, I will install the first MYSQL instance in the /var/lib/mysql_instance1 folder. The mysql_install_db program is located in the /usr/bin/ folder in my CENTOS LINUX environment. That is why I specified \"--basedir=/usr\" in the following example.Login as root user via running the \"su - \" command.<br />It will prompt you to enter the roor password<br />The \"-\" will load the ROOT shell environment.</p>\n<p># su - <br /># assuming bin/mysql_install_db is in the ENV path<br /># mysql_install_db --basedir=/usr --datadir=/var/lib/mysql_instance1</p>\n<p>&nbsp;</p>\n<p>After running the mysql_install_db, you should see some messages indicating the status of the database installation. If the database installation is successful, you should see some files created by the mysql_install_db.</p>\n<p>You can run the list directory command to check <br />to see if the database installation is successful.</p>\n<pre><code>\n# ls -al /var/lib/mysql_instance1/\ntotal 20504\ndrwx------.  5 mysql root      4096 Apr  9 17:29 .\ndrwxr-xr-x. 19 root  root      4096 Apr  9 17:06 ..\n-rw-rw----.  1 mysql root      2464 Apr  9 17:05 centos6.err\n-rw-rw----.  1 mysql mysql 10485760 Apr  9 17:29 ibdata1\n-rw-rw----.  1 mysql mysql  5242880 Apr  9 17:29 ib_logfile0\n-rw-rw----.  1 mysql mysql  5242880 Apr  9 17:01 ib_logfile1\ndrwx------.  2 mysql root      4096 Apr  9 16:42 mysql\ndrwx------.  2 mysql root      4096 Apr  9 16:42 test\n</code></pre>\n<p>&nbsp;</p>\n<p>Now, we will create the second MYSQL database instance. Just repeat the above step, except we will use a different directory this time for the second database instance: /var/lib/mysql_instance2.</p>\n<p>In case you copy and paste. Please notice the \"2\"<br />in the directory name: mysql_instance2.<br />This is the second MYSQL database instance we are installing.</p>\n<p># mysql_install_db --basedir=/usr --datadir=/var/lib/mysql_instance2</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Starting the MYSQL database instances you have just created<br />By now, you should have 2 MYSQL database installed. One is located in /var/lib/mysql_instance1, and the other in /var/lib/mysql_instance2.<br />To start the instance one. Simply do this:# mysqld_safe --no-defaults --datadir=/var/lib/mysql_instance1</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Create the multi user to administrate the mulitple MYSQL database instances<br />We will need to create a common MYSQL user to administrate all the MYSQL database instances. This way we can use the MYSQL program mysqld_multi to start/restart/shutdown the database instances.&nbsp;<br />To create the user, simply do the following:# the default root user has no password.<br /># by entering the following, it should login<br /># to the database as the MYSQL root user.<br /># it is very important to set up the root<br /># user password after you have finished setting up<br /># all the MYSQL database instances<br /># mysql -uroot<br /># we will create 2 users in the tutorial.<br /># one for administration<br /># the other for testing<br />mysql&gt; GRANT SHUTDOWN ON *.* TO \'multi_admin\'@\'localhost\' IDENTIFIED BY \'hard_password\';<br />mysql&gt; GRANT ALL on *.* to \'test\'@\'*\' IDENTIFIED BY \'test_password\';<br />mysql&gt; flush privileges;</p>\n<p>&nbsp;</p>\n<p>Now you need to shutdown the MYSQL instance1 database and repeat the same step for MYSQL database instance2. To shutdown, you need to use a linux shell prompt. Simple run this command:</p>\n<p># mysqladmin -uroot -p shutdown<br /># ok, now we will start up instance 2<br /># mysqld_safe --no-defaults --datadir=/var/lib/mysql_instance2<br /># Now we will login to database and create the users again<br /># mysql -uroot<br />mysql&gt; GRANT SHUTDOWN ON *.* TO \'multi_admin\'@\'localhost\' IDENTIFIED BY \'hard_password\';<br />mysql&gt; GRANT ALL on *.* to \'test\'@\'*\' IDENTIFIED BY \'test_password\';<br />mysql&gt; flush privileges;</p>\n<p>&nbsp;</p>\n<p>OK, we are almost there. We have setup the 2 MYSQL database instances. Now we will set up the MYSQL configuration, so we can start it up by the mysqld_multi program. The MYSQL linux configure file should be located in /etc/my.cnf. You should backup that file in case you need to revert your original MYSQL database setting.<br />To back up: run this command.</p>\n<p>cp /etc/my.cnf /etc/my.cnf.backup</p>\n<p>&nbsp;</p>\n<p>You backup MYSQL configuration should be in /etc/my.cnf.backup. Now we will setup the multiple instance MYSQL configuration. I just use a very basic config file to simplify the setup process. You can add more options to each MYSQL instance. Below is what I have for the 2 MYSQL instances. You can use \"vi\" editor to add these lines there. I assume you know how to edit a file on linux. Since you are the linux DBA.</p>\n<p>### contents of my.cnf for the multiple <br />### MYSQL instances<br />[mysqld_safe]<br />log-error=/var/log/mysqld.log<br />pid-file=/var/run/mysqld/mysqld.pid</p>\n<p>[mysqld_multi]<br />mysqld = /usr/local/bin/mysqld_safe<br />mysqladmin = /usr/local/bin/mysqladmin<br />user = multi_admin<br />password = hard_password</p>\n<p>[mysqld1]<br />socket = /var/lib/mysql_instance1/mysql.sock<br />port = 3307<br />pid-file = /var/lib/mysql_instance1/mysqld.pid<br />datadir = /var/lib/mysql_instance1<br />user = mysql</p>\n<p>[mysqld2]<br />socket = /var/lib/mysql_instance2/mysql.sock<br />port = 3308<br />pid-file = /var/lib/mysql_instance2/mysqld.pid<br />datadir = /var/lib/mysql_instance2<br />user = mysql</p>\n<p>&nbsp;</p>\n<p>Starting the MYSQL database instance with mysqld_multi<br />Congrats! Now we are on the way to start the instance. Base on the config, we will have the 1st instance listening on port 3307 and the 2nd MYSQL instance listening on port 3308. We will start both instances now.# command to start instance1<br /># mysqld_multi start 1<br /># command to test if instance1 is running<br /># mysqladmin ping --socket=/var/lib/mysql_instance1/mysql.sock<br /># You should see this message<br /># mysqld is alive</p>\n<p># command to start instance2<br /># mysqld_multi start 2<br /># command to test if instance2 is running<br /># mysqladmin ping --socket=/var/lib/mysql_instance2/mysql.sock<br /># You should see this message<br /># mysqld is alive</p>\n<p><br />&nbsp;</p>\n<p>&nbsp;</p>\n<p>Testing connection to individual database instances through the port number<br />To test the port number, you have to use the host name in the connection string. My host has the ip of 192.168.10.10### You should be to login with the following<br />### you have to change the host ip string though<br />### to your environment<br />mysql -utest -h 192.168.10.10 -ptest_password -P3307<br />mysql&gt;</p>\n<p>### to login to the 2nd database instance.<br />### simply change the port number to 3308<br />mysql -utest -h 192.168.10.10 -ptest_password -P3308<br />mysql&gt;</p>','multiple-mysql-database-instances-database-setup-tutorial','',4),(80,'MongoDb Query Example','MongoDb Query Example','<pre><code>Import example<br />\nImport sample data from offical Mongo db website<br />Assumed mongodb and tools already installed.<br /><br />Download sample data<br />from&nbsp;https://docs.mongodb.com/getting-started/shell/import-data/<br /><br />Download via wget<br />wget https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json<br />Import sample data into mongodb via mongo tool: mongoimport<br />mongoimport --db test --collection restaurants --drop --file ./primer-dataset.json<br /><br />2017-09-08T00:36:53.498+0000 connected to: localhost<br />2017-09-08T00:36:53.499+0000 dropping: test.restaurants<br />2017-09-08T00:36:54.559+0000 imported 25359 documents\n\nuse test;\n\n// this is like mysql show tables in a database\ndb.getCollectionNames();\n\n// rename table (collection name) from restaurants to renamed_restuarants\n// rename table (collection name) from restaurants to renamed_restuarants\ndb.restaurants.renameCollection(\'renamed_restuarants\');\n\n// rename table (collection name) from renamed_restuarants to restaurants\ndb.renamed_restuarants.renameCollection(\'restuarants\');\n\ndb.restaurants.findOne({\'name\' : \'Wendy\\\'S\'});\n\ndb.restaurants.count();\n\n// search with name \"Wen\" \n// case insensitive\ndb.restaurants.count({\'name\' : /Wen/i});\n\n// regular expression\n// start with 3 letter and one or more white space character\ndb.restaurants.findOne({\'name\' : {$regex: /^\\w{3}\\s+/});\n    \n// forEach and limit function\n// fetch 10 record \ndb.restaurants.find().limit(10).forEach( \n    function(Doc) { \n        print( \"restaurant name: \" + Doc.name ); \n});\n  \n \n// sort by name descending\ndb.restaurants.find().sort({name: -1}).limit(10).forEach( \n	function(Doc) { \n		print( \"restaurant name: \" + Doc.name ); \n});\n\n// sort ascending and not equal blank string\ndb.restaurants.find({\"name\" : {\"$ne\" : \"\"}}).sort({name: 1}).limit(10).forEach( \n	function(Doc) { \n		print( \"restaurant name: \" + Doc.name ); \n});\n</code></pre>','mongodb-query-example','',6);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registrationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hash` varchar(32) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  `roles` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (86,'','admin','youremail@youremail.com','5f4dcc3b5aa765d61d8327deb882cf99','2016-09-21 22:05:07','','0',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-21 22:40:29
