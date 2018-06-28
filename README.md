# Quantified Self (Rails)
  This application is an API designed to handle the backend processes of a frontend 'meal and food manager' called [Quantified Self Front End](https://github.com/anubiskhan/quantified-self-fe). The frontend is deployed via GitHub pages, while the backend is hosted on an instance of AWS Elastic Beanstalk. MY [AWS](https://quantified-self-retry.us-west-2.elasticbeanstalk.com) instance.

  It is essentially a collection of endpoints that provide CRUD functionality for Food, and psuedo-CRUD functionality for Meals. (An end user cannot create or destroy meals, but is able to create associations between pre-seeded meals and foods).

### Setup
In order to consume the API, take the following steps:
  1. Clone down this repository to your local machine
  ```
  git clone git@github.com:anubiskhan/quantified-self-rails.git
  ```
  and head into the directory
  ```
  cd quantified-self-rails/
  ```
  2. Run the following on your command line in order to make sure that you'll have all of the necessary gems
  ```
  bundle install
  ```

  3. In order to get the database established and seeded run the following on your command line
  ```
  rails db:{create,migrate,seed}
  ```
  4. Initialize the server by running the following on your command line
  ```
  rails s
  ```

### Endpoints

#### Foods
```
GET /api/v1/foods
```
Returns all food objects
```
GET /api/v1/foods/:id
```
Returns the food object with the given :id
```
POST /api/v1/foods/
```
Creates a new food object
Returns the food object
```
PATCH /api/v1/foods/:id
```
Updates the existing food object with the given :id
Returns the food object
```
DELETE /api/v1/foods/:id
```
Deletes the existing food object with the given :id
Returns status 204

#### Meals
```
GET /api/v1/meals
```
Returns all meal objects along with associated foods
```
GET /api/v1/meals/:meal_id/foods
```
Returns the meal of given :meal_id with associated food objects
```
POST /api/v1/meals/:meal_id/foods/:id
```
Creates a new association between the meal object and food object of the given :meal_id and :id, respectively
```
DELETE /api/v1/meals/:meal_id/foods/:id
```
Deletes the association between the meal object and food object of the given :meal_id and :id, respectively

#### Testing (100% coverage)
Run
```
rspec
```
on the command line
