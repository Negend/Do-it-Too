# Refactoring Steps
App works but is far from perfect, with time there will be many ways to go about maing improvements
## New Features
A list of features to be considered in future once there is free time
### Cloud Storage
#### Summary
With the Carrier-wave or **imgur** ruby gem, or an alternative Images should now be saved in a cloud storaged and then linked to the website once uploaded to prevent databas wipipng on restart
#### Steps
* install and require carrierwave gem
* creacte uploader class and inherit carrier methods
* create a method that uploads any file in the public/uploads and stores in clouds then sets url to database table
* edit current method so files are uploaded to the uploads folder but urls are not saved to database
*integerate new and old method so that files are uploaded thru normal process and then saved to cloud with their links in database

## Design Change
