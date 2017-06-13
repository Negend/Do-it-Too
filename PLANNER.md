#Do It Too
##Aim
An application made for wee5/6 project for sparta-global. Creating an app demonstrating use of the MVC model having 7 resfull routes.
This has led to the creation of Do It Too
	
##What it does
A refreshing website thats interactive. A picture based forum that lets users upload pictures (of themselves mainly) mimicking/replicating/demonstrating a photo thats suggested on the page.
users will have the ability to rate other users based on humour or accuracy. They will receive the ability to **edit** the ratings of other users posts. the ability to delete their own posts too and the ability to look through posts for different pictures




##Method
###sql
* table of posts
  * Post contains;
  		* id
  		* picture id(secondary key from table or array of picture being mimicked
  		
  		* user id()
  		* rating feature two numbers one increase by 1-5  and the other increasing by 5's a  ratio is represented in percentage)
  		* file(picture url) (if pic fails; drop post)

  	* editable features;
  	  * Entire post by the user except rating
  	  * rating editable by other users
  	* restrictions
  	   * url must be valid url or file must be valid file
  	   * rating is 1-5 starting with 5 (buttons with js)
  	   * no swear words
  
  * extra table for members including their date user name id and password






##MVP
Targets in order of wishful thinking starting from easiest

* mvp will be giving users an abilty to post pictures with editable ratings
* having certain pictures posted appear on  specific pages
* make it look goood
* make user membership
* ability to see all pictures posted by specific user
* comment section

