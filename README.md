![Build Status](https://codeship.com/projects/793b8130-340b-0135-6abb-4afe72fab10a/status?branch=master)
![Code Climate](https://codeclimate.com/github/jtabas/museum-reviews.png)
![Coverage Status](https://coveralls.io/repos/jtabas/museum-reviews/badge.png)

# README

  Exhibit Philly is designed for exploring Museum's all over Philadelphia! Users can search for specific museums or look at the list which is populated using the Google Places api. Clicking on the museum takes the user to a show page which has details and reviews about the museum. Registered users can leave reviews for museums and vote on other users reviews, the most popular reviews are shown at the top of the list. Other features include e-mail notifications, a user profile page and user account profile pictures. This project has been a collaboration between Brian Karol, Chris Donohue, David MacMurtrie and Joe Tabas.

  Visit our site here
  https://museum-reviews.herokuapp.com/

* This project was made using Ruby on Rails, Reactjs, PostgreSQL and Foundation

* Ruby version 2.3.3

* Gems:
  Devise
  Carrierwave
  ActionMailer

* Database creation:
  run 'rake db:create'

* Database initialization:
  run 'rake db:migrate'

* How to run the test suite?
  run 'rake'
