#1 Introduction
This is source code for Healthfundit (work in progress). A web application to help crowdfund life saving medical research.

#1 Requirements
+ Ruby Version 1.9.3
+ Rails Version 3.2.15
+ Postgres
+ A bucket on AWS S3

#1 Setup
+ Keep your AWS security credentials and bucket name handy
+ [Install Postgres](http://www.postgresql.org/download/macosx/)
+ Create a database named healthfundit_development (no username or password should be required to connect to the database)
+ [Install RVM](http://rvm.io/rvm/install)
+ Install Ruby (rvm install 1.9.3)
+ Download / checkout source
+ Create a gemset (rvm gemset create healthfundit)
+ cd to the project root
+ rvm 1.9.3@healthfundit
+ gem install rails -v 3.2.15
+ rvm --ruby-version use 1.9.3@healthfundit
+ In the app/initializers folder create a file called s3_constants.rb with following code inside it (replace the S3 constant values):

    if Rails.env.development?
        AWS_ACCESS_KEY_ID = "your aws access key id"
        AWS_SECRET_ACCESS_KEY = "your aws access key"
        S3_BUCKET_NAME = "your s3 bucket name"
    end

+ bundle install
+ rake db:migrate
+ rails s
+ Go to localhost:3000 for the app. To localhost:3000/admin for administration (username: admin@example.com password: please).



