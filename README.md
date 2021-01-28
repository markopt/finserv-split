# Rails Optimizely Full Stack Demo Site
---
![Community Bank Demo Screenshot](https://s3.ap-southeast-2.amazonaws.com/optly-images/community_bank_screenshot.png)

This app was developed to help showcase how [Optimizely Full Stack](https://developers.optimizely.com/x/solutions/sdks/introduction/index.html?language=ruby) could be integrated into a Ruby on Rails application to perform server side experiments and feature management using the [Optimizely Ruby SDK](https://github.com/optimizely/ruby-sdk).

## Use Cases

Currently the only use case this repo is setup to demonstrate is using a feature flag to either render or not render entirely a promotional banner on the user account page. This server rendered banner also includes variables that can be controlled using the Optimizely interface as part of an experiment or feature rollout.

Optimizely Full Stack can enables product development teams to run experiments and rollout new features across any digital touchpoint, and anywhere they're writing code.

## Optimizely Implementation

See our developer documentation for full information on implementing the [Optimizely Ruby SDK](https://developers.optimizely.com/x/solutions/sdks/reference/index.html?language=ruby).

In this application, we implemented the SDK in ```/app/controllers/application_controller.rb``` so that the functionality could be shared across all controllers.

We create a simple method to instantiate the client, this method is also helpful when we need to re-instantiate the client after a change is made in your Optimizely account to ensure you're running with the most up to date experiment configuration.

```ruby
 def instantiate_optimizely
    uri = URI("https://optimizely.s3.amazonaws.com/json/#{FULLSTACK_PROJECT_ID}.json")
    datafile = HTTParty.get(uri).body
    @@optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)
  end
```

We added another simple method to check if the client had already been instantiated so as to prevent any unnecessary network calls.

```ruby
  def optimizely_obj
    @@optimizely_client ||= instantiate_optimizely
  end
```

Finally we created a method to accept incoming POST requests from Optimizely's webhook to update the client anytime a change is made from the Optimizely UI

```ruby
  def update_optimizely
    instantiate_optimizely
  end
```

And with that we're ready to begin using the Optimizely SDK!

## Requirements
This application requires the following:

- Rails 5 or greater
- Ruby 2.2.2 or greater
- Postgres

## Run the site locally

### App + Dependencies

1. Verify you have Ruby 2.2.0 or greater by running ```ruby -v``` in the terminal

- If you have an outdated version of Ruby use a [Ruby manager](https://rvm.io/), such as RVM to update your version of Ruby
- If you don't have Ruby installed, you can install both the latest versions of RVM, Ruby, and Rails by running the following in your terminal window ```curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails```
- Once the above is complete, run ```ruby -v``` and ```rails -v``` to ensure both Ruby and Rails were installed correctly

2. If you haven't installed or ran a Postgres server locally, run the following ```brew install postgres``` and ```gem install pg -- --with-pg-config=/usr/local/bin/pg_config```
3. Start Postgres using Homebrew by running ```brew tap homebrew/services``` and ```brew services start postgresql```
- Note: to stop postgres simply run ```brew services stop postgresql```
3. Clone or fork this repo in your desired repo
4. Navigate to the cloned app directory
5. Change the username in ```/config/database.yml``` to your computers username for the development and test environment
6. Run ```bundle install```
7. Run ```rails db:create```
8. Run ```rails db:migrate```

### Starting the app locally
Note: Once the above has been completed, anytime you wish to run the application locally, simply navigate to main directory for the application and run ```rails server``` or ```rails s``` and go to ```localhost:3000``` in your browser

## Initial commit