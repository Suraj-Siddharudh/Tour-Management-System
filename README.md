# Tours Booking Application

<p align="center">
</p>

The project is done using the concepts of Ruby on Rails for development for the fulfillment of the requirements of Assignment 2 of CSC 517 Object Oriented Design and Development. 

The purpose of this project is to design a portal for booking tours. In the project, there are two access models: agent and users. Users can create tours and edit their tours. Agents can edit the bookings of the users and the tours and user details.

We have also added the email feature with confirmations and a Google login feature with only NC State email ids.
 
## Deployment 

We have deployed our project on **Heroku**. To view, [click here](https://evening-shore-78978.herokuapp.com/ ).

## Credentials

| Role | Email | Password | Notes |
| --- | --- | --- | --- |
| Admin | admin@touringapp.com | admin123 | Cannot be deleted |
| Customer | customer@touringapp.com | customer123 | Unless deleted by someone |
| Agent | agent@touringapp.com | agent123 | Unless deleted by someone |

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
### Admin
   - Log in with an email and password.
   - Edit profile
   - Create agent and customer accounts (users).
   - View the list of all users and their profile details (except password).
   - Edit or delete users (agents or customers) from the system

### Agent
  - Login with email and password.
  - List a tour.  
  - Edit/update/delete/cancel tours that they have posted. 
  - Cannot edit tours posted by other agents.
  - View all tours (including those listed by others).
  - Upload and delete pictures of tours that they themselves have listed. 
  - View list of all customers who have bookmarked a tour (created by them).
  - Agent should be able to delete his own account.

### Customer
  - Log in with email and password.
  - Bookmark tours they are interested in.
  - View information about tours
  - Customer should be able to delete his own account.

### Miscellaneous
   - All users can use their **Google account** with NCSU email id to log into the system
    


## Contributors (Alphabetically)

  - Aishwarya Tirumala - atiruma 
  - Pratik Kumar Kundanmal Jain - pjain22
  - Suraj Siddharudh - ssiddha

# Note 
All commits are in dev_branch and not master
