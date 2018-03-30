# MarkLogic Search Application

	The purpose of this file is to describes how easy it is 
	to build from scratch a basic web search application 
	and start testing it's functionality


## 1. INTRODUCTION

	This file outlines the steps required for:
	- installation of MarkLogic server 9
	- inserting xml based content into the MarkLogic database 
	    (using Shakespeare plays as the sample content).
	- build a basic web search application on top of MarkLogic server
	- start testing this application


## 2. REQUIREMENTS

	This project was tested with Windows 10 Operating System and Java 1.8 installed on top of it.
	It should work on any Linux platform as well.
	To start working on this MarkLogic project clone the current repository (e.g. using "git clone ..." command)


## 3. STEPS

3.1.	Download MarkLogic Server 9 through the browser or using the CURL tool.
	You may see download instructions at http://docs.marklogic.com/guide/installation.
<<<<<<< HEAD
=======
	CURL will be needed for further tests, so In case you don't have it install it from https://curl.haxx.se/ .
	On Windows OS you may want to run curl from gitbash environment, make sure you have it installed as well.
>>>>>>> 663be067579dd79c3811957f04d7979445d7bd73

3.2. 	Install MarkLogic Server 9 Server.  Make sure that you know the location where the server was installed
		
3.3.	Start MarkLogic service and admin server using e.g. Windows start option
	Verify that MarkLogic service is up by running the following command:
	```
			sc query MarkLogic
	```
		
	After completing this step make sure that:
		- you have active account at 
			https://developer.marklogic.com
		- you register for an account if you don't have one
		- you downloaded and installed MarkLogic developer license.  
		    (follow MarkLogic documentation to install the license)
		- you can view installed license at
			http://localhost:8001/license.xqy
 
3.4.	Download zipped content of Shakespare plays from 
			http://metalab.unc.edu/bosak/xml/eg/shaks200.zip

3.5.	Create db for storing shakespeare content. To do this:

	- cd to your MarkLogic 9 Server installation directory
	- run from gitbash shell command "use-db.sh <pswd>", where <pswd> is your admin password

3.6.	Create forest for storing shakespeare content and attach it to created db. To do this:

	- cd to your MarkLogic 9 Server installation directory
	- run from gitbash shell command "use-appserver.sh <pswd>", where <pswd> is your admin password

3.7.	Load downloaded Shakespeare content into MarkLogic Server. For doing this:

	- download MLCP tool from https://developer.marklogic.com/products/mlcp
	- run from gitbash shell command "load-input-compressed.sh <pswd>", where <pswd> is your admin password

3.8.	Create http based TestServer on the top of MarkLogic Server. To do this:

	- cd to your MarkLogic 9 Server installation directory
	- run from gitbash shell command "use-appserver.sh <pswd>", where <pswd> is your admin password
	- copy provided appdemo sources, including *.xqy, *.html and *.gif files, to the root of your newly created http server
	- you may rename this file to README.txt and copy to above folder
	- make sure that you can access the newly created http server from the browser and from the gitbash shell
		
3.9		List loaded Shaekespeare content in ascending and descending orders.  To do this:

		- point your browser to the ascending titles script at 
			http://localhost:<your-port>/titles-a.xqy
		- open a new browser panel
		- point a new panel to the decending titles script at 
			http://localhost:<your-port>/titles-d.xqy
		- compare the order of shakespare plays in both browser panels
		
3.10	Now let's implement search functionality for the word on "LINE" element in provided XML files.
	After that let's display the matching results grouped by document name.
	And finally let's highlight the searched word. For doing this:

		- point your browser to your newly created http server at 
			http://localhost:<your-port>/
		- make sure that on the right frame you can see the ordered list of all shakespeare plays
		- type in the search box on the left any word, e.g. Mark
		- make sure that the right frame displays the search results and higlights the searched word
		
3.11	Start testing your applications by using MarkLogic Test Engine. You can find detailed instructions at the following url:
		https://github.com/marklogic-community/widowmaker .

### Some notes to remember:
---------------------------
	- Implementation of search is case-sensitive
	- Only the whole word is highlighted. To highlight all occurences - press Ctrl + F and enter the word.
	- Pressing search button without entering any text presents all plays, grouped by filenames and sliced by LINE
	- To present again the ordered list of all plays press refresh icon in your browser