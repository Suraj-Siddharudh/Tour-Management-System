# Tours Booking Application

<p align="center">
</p>

The project is done using the concepts of Ruby on Rails for development for the fulfillment of the requirements of Assignment 2 of CSC 517 Object Oriented Design and Development. 

The purpose of this project is to design a portal for booking tours. In the project, there are three access models: admin, agent and users. Users can create tours and edit their tours. Agents can edit the bookings of the users and the tours and user details. Admin has access to all the functionalities.
 
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
git clone https://github.com/Suraj-Siddharudh/Tour-Management-System.git


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
   - Edit or delete users (agents or customers)/Tours/reviews from the system
   - View the list of all tours, along with detailed information.
   - View all fields of reviews (defined below) from customers.

### Agent
  - Login with email and password.
  - List a tour.  
  - Edit/update/delete/cancel tours that they have posted. (Cannot edit tours posted by other agents.)
  - View all tours (including those listed by others).
  - Upload and delete pictures of tours that they themselves have listed (Deleting can be done only by going to Edit Option). 
  - View list of all customers who have bookmarked a tour (created by them).
  - Agent should be able to delete his own account.
  - View reviews of a tour.
  - View list of all customers who have booked a tour.

### Customer
  - Log in with email and password.
  - Search available tours using filters, such as start date range, price range, tour name and locations visited during the tour (Itinerary)
  - Bookmark tours they are interested in.
  - Book n seats on a tour for "Active" Tours.
  - View information about tours
  - Customer is able to delete his own account.
  - Search available tours using filters, such as start date range, price range, tour name, slot availability and locations     visited during the tour (Itinerary)
  - Book n seats on a tour.
  - Cancel a booking completely or cancel a few seats from a booking done previously.
  - Submit a review for a tour that that customer has already taken.
  - Edit or delete a review they previously submitted.

### Miscellaneous
   - Testing is thoroughly done for the user model and user controller.
   - All users can use their **Google account** with NCSU email id to log into the system
   - An email is sent when the status of the customer moves from waitlist to booked.

### Note
   - For partial cancellation of booking, please use update functionality from "My Bookings"
   - Customer can add review only after booking a tour and status is "Completed".
   - Tours cannot be booked if status is "Completed".
   - Tours with "Active" status corresponds to both ongoing tours and upcoming tours.

## Contributors (Alphabetically)

  - Aishwarya Tirumala - atiruma 
  - Pratik Kumar Kundanmal Jain - pjain22
  - Suraj Siddharudh - ssiddha
