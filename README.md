#Logbook

### GA WDI NYC Jan14, Project 1
### Overview

**Logbook** is a interactive skydiving logbook. Which can conatain many users and each user has his own logbok. He can log jumps, edit details of jumps (as jump number, equipment and aircraft that were used etc...). Add pictures and videos for each jump. Leave comments on pictures. Share jump details including pictures and videos with other users giving them just view permision. User can draw his personal signature and witness-stamp jumps that are shared with him. User can browes through his and other jumps through interactive calendar.

### Technologies Used
Back-end:

*Ruby 2.1.0
*Ruby on Rails 4.0.2
*PostgreSQL Database
*Authentication and Authorization using [bcrypt-ruby]
*paperclip gem for image upload
*AWS S3 storage to store images

Front-end:
*jQuery AJAX
*jQuery UI Accordion
*HTML5
*CSS3
*HTML5 Canvas for user's signature
*Zurb Foundation Framework

### User Stories Completed

* As a user I can update my information details.
* As a user I can add a jump in the logbook,browse them, delete or edit details
* As a user I can add pictures via links or upload from his computer to each particular jump and delete them.
* As a user I can add and delete videos to each particular jump
* As a user I can log in, log out with password and email and my profile is secure.
* As a user I can share my jumps with other users and restrict access for them.
* As a user I can comment on my pictures and pictures of jumps that are shared with me
* As a user I can upload avatar
* As a user I can browse the jumps through event calendar

Links:
*Heroku: http://skydivepages.herokuapp.com/
*Pivotal Tracker: https://www.pivotaltracker.com/s/projects/1015874