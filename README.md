# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

CI/CD: 

All our continuous integration (CI) and continuous deployment (CD) are handled by three yml files (each handling a different GitHub Action) which can be found in ./github/workflows. The first file, heroku_main.yml, handles the continuous deployment for the application. It executes anytime a pull request is made into the main branch of the repository. Once a pull request is committed, this action takes the updated code in the main branch and pushes it to Heroku. This action ensures that the website is always using the most stable and up-to-date code. The next file, main.yml, executes anytime there is a pull request to or from the development and main branches. This action takes the code trying to be committed and attempts to build it in a test environment. With this, developers can confirm that the pushed code is stable enough to build and won’t damage the version from the main or development branches. It is also very important to note that for this action to work, the credentials for the test database need to be set to postgres superuser (username: postgres and password: postgres). You can change these credentials in the database.yml in the config folder of the repository. For the third and last file, rubocop.yml, this is a GitHub action solely responsible for style checking.  On any attempt to push, this action will run Rubocop on the code and display any styling violations to the developer before the code is finally committed.  

 

Testing: 

In the spec folder, you will find various rspec files meant to test the functionality of the application. In order to run these files locally you will need to first have rspec and Capybara installed on your local machine. Then, from a command terminal on the root directory of the project, run the command below. 

rspec    spec/”name of file” 

Brakeman 

cd into root directory for application  

```brakeman``` 

rubocop 

cd into root directory for application 

```rubocop``` 

 

System Dependencies: 

Ubuntu (latest version) 

Ruby version: 2.7.2  

install Ruby Version Manager (RVM)  

Install ruby ```rvm install ruby-2.7.2``` 

Nodejs and Yarn 

```sudo apt install yarn nodejs``` 

 Rails 6.1.3.1 

```gem install rails –v 6.1.3.1``` 

 Postgres 12 

```sudo apt install postgresql postgresql-contrib libpq -dev –y``` 

 

Creating Local Database 

Create Database specified in app/config/database.yml  

```rails db:create``` 

 

Execute Code 

Start the database:  

```sudo service postgresql start``` 

Make sure port number in app/config/database.yml matches port number that postgresql is using. 

Migrate the current database 

```rails db:migrate``` 

Bundle all required gems 

```bundle install``` 

Run application 

```rails s``` 

 

Google authentication 

Joshua’s section 

 

Deploy code to Heroku 

Joshua’s section 
