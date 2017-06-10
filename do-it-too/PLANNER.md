#Do It Too
##Huh?
A refreshing website thats interactive. A picture based forum that lets users upload pictures (of themselves mainly) mimicking/replicating/demonstrating a photo thats suggested on the page.
users will have the ability to rate other users based on humour or accuracy. They will receive the ability to **edit** the ratings of other users posts. the ability to delete their posts too and the ability to look through posts for different pictures

bonus. to have uploadable photos

##seriously?
###sql
* table of posts
  * Post contains;
  		* id
  		* picture id(secondary key from table or array of picture being mimicked
  		* user name(title)
  		* user id(bonus, make them be members first)
  		* ratingfeature 1-5  avg is represented in persentage)
  		* body(picture url) (if pic fails; drop post)

  	* editable features;
  	  * Entire post by the user except rating
  	  * rating editable by other users
  	* restrictions
  	   * url must be valid url or file must be valid file
  	   * rating is 1-5 starting with 5 (buttons with js)
  	   * no swear words
  	   
* bonus table of comments sharing secondary key user id and picture id. 




##woah!
Targets in order of wishful thinking starting from easiest

* mvp will be giving users an abilty to post pictures with editable ratings
* having certain pictures posted appear on  specific pages
* make it look sexy
* make user membership
* ability to see all pictures posted by specific user
* comment section

##progress
styling baby
