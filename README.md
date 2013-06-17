#Tuneline

Tuneline aggregates your music listening across LastFM and Soundcloud into one central feed. I was the design lead on this project and led the implementation of a jQuery Masonry based user feed, which beautifully laid out all the users Tuneline feed content. From a technical standpoint, we leveraged hstore and single table inheritance to easily create the relationship between a user and their many feed items.


###What to look for
* Front-End Design
* Single Table Inheritance
* Use of hStore data type

****

####The live hosted heroku app can be found at
* www.streamrolled.com
* To login use your twitter login details
  * As twitter has some rate limiting issues to deal with, upon login, it may take a few moments for the background workers to fire off and retrieve your Twitter "follower" nodes
* To integrate with either LastFM or Soundcloud
  * Just click on the integrate buttons seen on the screen after login and use your account details for those providers

****

###Getting started locally with Tuneline
* Clone down the repo
  * git clone git@github.com:phoenixbox/feed_engine.git
* Bundle the gems
  * bundle install
* Create the database, migrate it, create the seed data, set-up the tests
  * rake db:migrate db:test:prepare
* Run the tests if you like
  * rspec spec
* This application uses figaro so as to not push sensitive API keys to the public repository, however for the purposes of the demonstration I will provide the keys here for your use. Be nice with them please!
  * TWITTER_CONSUMER_KEY: wLdYZlHYwPdq0k4qCix8w
  * TWITTER_CONSUMER_SECRET: 0SyPlmjT2yoSNdvhlZsLUd1GIYnMqeVwkUHh10GQw
  * SOUNDCLOUD_CONSUMER_KEY: a67797de26dd0fd72e4deee7f806a442
  * SOUNDCLOUD_CONSUMER_SECRET: 43e99ec45c9ea189ace94c5601bd2683
  * LASTFM_CONSUMER_KEY: e3e2bbb3aee8ddc5eaf6ec838b2bb66a
  * LASTFM_CONSUMER_SECRET: c0252cf1aac5e9bce13109a49fff6dd8
* From the command line run
  * rails generate figaro:install
  * this will create an application.yml file in the confi directory
  * just copy and paste the keys from above in there and the environment variables should be set
* Run the app locally
  * rails s
* Visit http://localhost:3000 in your browser
* Login with your normal twitter login details
* NOTE - There should be no problem with the assets styling but if the page looks funky run from the command line:
  * rake assets:clean