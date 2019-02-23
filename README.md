# Tours Booking Application

<p align="center">
</p>

The project is done using the concepts of Ruby on Rails for development for the fulfillment of the requirements of Assignment 2 of CSC 517 Object Oriented Design and Development. 

The purpose of this project is to design a portal for booking tours. In the project, there are two access models: agent and users. Users can create tours and edit their tours. Agents can edit the bookings of the users, the user details and

We have also added the email feature with the replies to any inquiry and a Google login feature with only NC State email ids.
 
## Deployment 

We have deployed our project on **Heroku**. To view, [click here](https://evening-shore-78978.herokuapp.com/ ).


## Local Deployment

To run the app locally, follow these steps:

- Clone the repository on your local machine.
git clone https://github.com/Suraj-Siddharudh/Toor-Management-System.git

-Checkout to dev_branch
git checkout dev_branch

- Go to the directory of the project where it is cloned using terminal



- Install gems
bundle install
-  Complete Database Migrations
rake db:migrate
- Add pre-configured users
rake db:seed
- Run server
rails server
Your app will run on http://localhost:3000


## Features created
  - Log in to the system
  - Sign up
  - Log in using google auth
  - View tours
  - Edit users
  - Create, show, edit, update and delete tours
  - Users can be added, viewed and edited.
  - View the details (except password) of other users
  - View the list of tours along with detailed information
  - Make a booking reservation.
    


## Contributors

  - Pratik Kumar Kundanmal Jain - pjain22
  - Suraj Siddharudh - ssiddha
  - Aishwarya Tirumala - atiruma

# Note 
All commits are in dev_branch and not master
