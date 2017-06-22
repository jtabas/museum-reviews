![Build Status](https://codeship.com/projects/793b8130-340b-0135-6abb-4afe72fab10a/status?branch=master)
![Code Climate](https://codeclimate.com/github/jtabas/museum-reviews.png)
![Coverage Status](https://coveralls.io/repos/jtabas/museum-reviews/badge.png)

# README

  Exhibit Philly is designed to be a resource for exploring Museum's all over Philadelphia! Users can search for museums or look at the list; clicking on the museum takes the user to a show page which has details and reviews. The list of museums is populated using the Google Places api; registered users can leave reviews for museums and vote others reviews, the most popular reviews are shown at the top of the list. Other features include e-mail notifications. a user profile page and the ability to have a profile picture. This project has been a group effort between Brian Karol, Chris Donohue, David MacMurtrie and Joe Tabas.

  Visit out our site using the link below
  https://museum-reviews.herokuapp.com/

* This project was made using Ruby on Rails, Reactjs, PostgreSQL and Foundation

* Ruby version 2.3.3

* Gems
  Devise
  Carrierwave
  ActionMailer

* Database creation
  run 'rake db:create'

* Database initialization
  run 'rake db:migrate'

* How to run the test suite?
  run 'rake'
