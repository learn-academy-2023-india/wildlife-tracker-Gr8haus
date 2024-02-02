# Wildlife Tracker Challenge
The Forest Service is considering a proposal to place in conservancy a forest of virgin Douglas fir just outside of Portland, Oregon. Before they give the go ahead, they need to do an environmental impact study. They've asked you to build an API the rangers can use to report wildlife sightings.
  ### Process
  #### Create a new Rails app on the desktop: 
    $ rails new rails-api -d postgresql -T
    $ cd rails-api
  #### Create a database: 
    $ rails db:create
  #### Add the git remote from GitHub Classroom
    git remote add origin https://github.com/learn-academy-2023-india/wildlife-tracker-Gr8haus.git
  #### Ensure a main branch exists
    git checkout 
  #### Make an initial commit to the main branch
    git add .
    git commit -m "initial commit"
    git push origin main
  #### Add the dependencies for RSpec:
    $ bundle add rspec-rails
    $ rails generate rspec:install
  #### Generate the resource with appropriate columns and data types
    $ rails generate resource Animal common_name:string scientific_binomial:string
    $ rails db:migrate
  #### Begin the rails server: 
    $ rails server
  #### In a browser navigate to: 
    http://localhost:3000

## Story 1: In order to track wildlife sightings, as a user of the API, I need to manage animals.

### Branch: animal-crud-actions
  git checkout -b animal-crud-actions

### Acceptance Criteria

### Create a resource for animal with the following information: common name and scientific binomial
  <!-- $ rails generate resource Sighting animal_id:integer latitude:string longitude:string date:string
  $ rails db:migrate 
  Already previously done in this instance-->
  
  <!-- Disable Authenticity Token
  skip_before_action :verify_authenticity_token
  this is needed for POSTman to be able to make requests
  -->
#### Can see the data response of all the animals
  class AnimalsController < ApplicationController
    def index
      animal = Animal.all
      render json: animal
    end
  end
#### Can create a new animal in the database
  Post - Body - Raw - JSON
  {
    "common_name": "Red Tree Vole",
    "scientific_binomial": "Arborimus longicaudus"
  }
#### Can update an existing animal in the database
  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors
    end
  end
#### Can remove an animal entry in the database
  def destroy
    animal = Animal.find(params[:id])
    if animal.destroy
      render json: animal
    else
      render json: animal.errors
    end
  end
  

## Story 2: In order to track wildlife sightings, as a user of the API, I need to manage animal sightings.

### Branch: sighting-crud-actions
  git checkout -b sighting-crud-actions
### Acceptance Criteria

### Create a resource for animal sightings with the following information: latitude, longitude, date
  # Hint: An animal has_many sightings (rails g resource Sighting animal_id:integer ...)
  # Hint: Date is written in Active Record as yyyy-mm-dd (“2022-07-28")
    $ rails generate resource Sighting animal_id:integer latitude:string longitude:string date:string
    $ rails db:migrate
#### Can create a new animal sighting in the database
  {
    "latitude": "here",
    "longitude": "there"
    "date": "2024-01-31"
  }
#### Can update an existing animal sighting in the database
  def update
    sighting = Sighting.find(params[:id])
    sighting.update(sightings_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end
#### Can remove an animal sighting in the database
  def destroy
    sighting = Sighting.find(params[:id])
    if sighting.destroy
      render json: sighting
    else
      render json: sighting.errors
    end
  end

## Story 3: In order to see the wildlife sightings, as a user of the API, I need to run reports on animal sightings.

### Branch: animal-sightings-reports
  git checkout -b animal-sightings-reports
### Acceptance Criteria

#### Can see one animal with all its associated sightings
  # Hint: Checkout this (https://github.com/learn-co-students/js-rails-as-api-rendering-related-object-data-in-json-v-000#using-include) example on how to include associated records
  

#### Can see all the all sightings during a given time period
  # Hint: Your controller can use a range to look like this:
  <!-- class SightingsController < ApplicationController
    def index
      sightings = Sighting.where(date: params[:start_date]..params[:end_date])
      render json: sightings
    end
  end -->
#### Hint: Be sure to add the start_date and end_date to what is permitted in your strong parameters method
#### Hint: Utilize the params section in Postman to ease the developer experience
#### Hint: Routes with params

# Stretch Challenges

## Story 4: In order to see the wildlife sightings contain valid data, as a user of the API, I need to include proper specs.

### Branch: animal-sightings-specs

### Acceptance Criteria
#### Validations will require specs in spec/models and the controller methods will require specs in spec/requests.

#### Can see validation errors if an animal doesn't include a common name and scientific binomial
#### Can see validation errors if a sighting doesn't include latitude, longitude, or a date
#### Can see a validation error if an animal's common name exactly matches the scientific binomial
#### Can see a validation error if the animal's common name and scientific binomial are not unique
#### Can see a status code of 422 when a post request can not be completed because of validation errors
#### Hint: Handling Errors in an API Application the Rails Way

## Story 5: In order to increase efficiency, as a user of the API, I need to add an animal and a sighting at the same time.

### Branch: submit-animal-with-sightings

### Acceptance Criteria

#### Can create new animal along with sighting data in a single API request
#### Hint: Look into accepts_nested_attributes_for
