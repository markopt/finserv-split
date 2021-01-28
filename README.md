# Rails // Split Demo App
---
![Community Bank Demo Screenshot](https://s3.ap-southeast-2.amazonaws.com/optly-images/community_bank_screenshot.png)

## Use Cases

Currently the only use case this repo is setup to demonstrate is using a split to either render or not render entirely a promotional banner on the user account page. This server rendered banner also includes configurations that can be controlled using the Split interface as part of an experiment or feature feature flag.

## Implementation

See our developer documentation for full information on implementing the [Split Ruby SDK](https://help.split.io/hc/en-us/articles/360020673251-Ruby-SDK).

In this application, we implemented the SDK in ```/app/controllers/application_controller.rb``` so that the functionality could be shared across all controllers.

We create a simple method to instantiate the client, this method is also helpful when we need to re-instantiate the client after a change is made in your Split account to ensure you're running with the most up to date experiment configuration.

```ruby
 def instantiate_split
    split_factory = SplitIoClient::SplitFactory.new(LOCAL_KEY)
    split_client = split_factory.client
    begin  
      split_client.block_until_ready  
    rescue SplitIoClient::SDKBlockerTimeoutExpiredException
      puts 'SDK is not ready. Decide whether to continue or abort execution'  
    end  
    split_client
  end
```

Once the client has been created, we can then start using it to fetch treatments for a given user

```ruby
 @enabled = split_obj.get_treatment(user_id, 'finserv-promo')
 ```

And with that we're ready to begin using the Split SDK!

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