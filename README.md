
- Documentation:
  - [TamuIceHockey Stat Tracker Report](https://teams.microsoft.com/l/file/F5003B7A-ABC1-4932-B401-44FDFD6852B9?tenantId=68f381e3-46da-47b9-ba57-6f322b8f0da1&fileType=docx&objectUrl=https%3A%2F%2Ftamucs.sharepoint.com%2Fteams%2FTeam-Team-SP21-CSCE431-SoftwareEngineering-4-Sec501-MW-2.55-12372%2FShared%20Documents%2F4-Sec%20501-MW-2.55-12372%2FFinal%20Report%2FTAMUIH%20Stat%20Tracker%20Project%20Document.docx&baseUrl=https%3A%2F%2Ftamucs.sharepoint.com%2Fteams%2FTeam-Team-SP21-CSCE431-SoftwareEngineering-4-Sec501-MW-2.55-12372&serviceName=teams&threadId=19:73c3f76eaa45495a8468fd24f404c1db@thread.tacv2&groupId=a77ea6a8-5da3-4491-a01f-1a0ba6bfcce7)

- CI/CD:
  - All our continuous integration (CI) and continuous deployment (CD) are handled by three yml files (each handling a different GitHub Action) which can be found in ./github/workflows. The first file, heroku\_main.yml, handles the continuous deployment for the application. It executes anytime a pull request is made into the main branch of the repository. Once a pull request is committed, this action takes the updated code in the main branch and pushes it to Heroku. This action ensures that the website is always using the most stable and up-to-date code. The next file, main.yml, executes anytime there is a pull request to or from the development and main branches. This action takes the code trying to be committed and attempts to build it in a test environment. With this, developers can confirm that the pushed code is stable enough to build and won&#39;t damage the version from the main or development branches. It is also very important to note that for this action to work, the credentials for the test database need to be set to postgres superuser (username: postgres and password: postgres). You can change these credentials in the database.yml in the config folder of the repository. For the third and last file, rubocop.yml, this is a GitHub action solely responsible for style checking. On any attempt to push, this action will run Rubocop on the code and display any styling violations to the developer before the code is finally committed.

- Testing:
  - In the spec folder, you will find various rspec files meant to test the functionality of the application. In order to run these files locally you will need to first have rspec and Capybara installed on your local machine. Then, from a command terminal on the root directory of the project, run the command below.
    - ```rspec spec/<Name of file>```
  - Brakeman
    - cd into root directory for application
    - ```brakeman```
  - rubocop
    - cd into root directory for application
    - ```rubocop```

- System Dependencies:
  - [Ubuntu (latest version)](https://ubuntu.com/tutorials/ubuntu-on-windows#4-install-ubuntu-for-windows-10)
  - Ruby version: 2.7.2
    - install [Ruby Version Manager (RVM)](https://rvm.io/rvm/install)
    - Install ruby ```rvm install ruby-2.7.2```
  - Nodejs and Yarn
    - ```sudo apt install yarn nodejs```
  - Rails 6.1.3.1
    - ```gem install rails –v 6.1.3.1```
  - Postgres 12
    - ```sudo apt install postgresql postgresql-contrib libpq -dev –y```

- Creating Local Database
  - Create Database specified in app/config/database.yml
    - ```rails db:create```

- Execute Code
  - Start the database:
    - ```sudo service postgresql start```
    - Make sure port number in app/config/database.yml matches port number that postgresql is using.
  - Migrate the current database
    - ```rails db:migrate```
  - Bundle all required gems
    - ```bundle install```
  - Run application
    - ```rails s```

- Google authentication
  - To log in with your @gmail.com or @tamu.edu address, click the "Admin Login" button at the top right of the window
  - To add an admin to the admins table:
    - ```sudo -u postgres psql```
    - ```\c tamuicehockey_production```
    - ``INSERT INTO admins (email) VALUES ('YourEmailHere@gmail.com');

- Deploy code to Heroku
  - To push code manually to Heroku, first [install the Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli), then follow these steps:
    - ```heroku login```
    - ```heroku git:remote -a your-app-here-12345```
    - ```git push heroku main```
