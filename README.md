# Senpai repair back office

## Description

Senpai repair shop back office software.

## Setup

Install Ruby gems dependencies at local install path as vendor/bundle

```
bundle install --path vendor/bundle
```

Setup migrations and seed data

```
bundle exec rake db:migrate db:seed
```

Start the backend development server

This server is visible at port
[http://localhost:9292](http://localhost:9292).

## Requirements achieved

- Use Active Record to interact with a database (YES)
- Have at least two models with a one-to-many relationship  (YES)
- At a minimum, set up the following API routes in Sinatra:
  - create and read actions for both models (YES)
  - full CRUD capability for one of the models: 
  The update action should be implemented using a form that is 
  pre-filled with existing values for the object. On submission of 
  the form, the object should update. Note: Using a like button or 
  similar will not meet the update requirement.
- Build a separate React frontend application that interacts with the API to
  perform CRUD actions. (YES - SEPARATE REPOSITORY)
- Implement proper front end state management. You should be updating state using a
  setState function after receiving your response from a POST, PATCH, or DELETE 
  request. You should NOT be relying on a GET request to update state. 
- Use good OO design patterns. You should have separate classes for each of your
  models, and create instance and class methods as necessary. 
- Routes in your application (both client side and back end) should follow RESTful
  conventions. (YES - SEPARATE REPOSITORY)
- Use your back end optimally. Pass JSON for related associations to the front 
  end from the back end. You should use active record methods in your controller to grab
  the needed data from your database and provide as JSON to the front end. You
  should NOT be relying on filtering front end state or a separate fetch request to
  retrieve related data. (YES - IN PROGRESS)
  
## API endpoints supported

### Service people
- POST /service_people
- GET /service_people
- GET /service_people/:id
- DELETE /service_people/:id

### Jobs
- POST /jobs
- GET /jobs
- GET /jobs/:id

### Job categories
- POST /job_categories
- GET /job_categories/:id
- DELETE /job_categories/:id 

