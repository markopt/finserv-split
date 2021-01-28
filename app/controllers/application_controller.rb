class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :optimizely_obj, :set_user

  include SessionsHelper
  include HTTParty
  require "optimizely"
  require 'uri'

  # Optimizely Project ID
  # Replace this with your own Optimizely Full Stack Project ID
  FULLSTACK_PROJECT_ID = 'EGLGbd3P1Y1fS6Q83Z5mdU'
  # WEB_PROJECT_ID = '9015821052'

  def update_optimizely
    instantiate_optimizely
  end
  
  private
  
  # Method used to determine if Optimizely has been defined yet
  def optimizely_obj
    p 'Checking to see if Optimizely object exists'
    # Checks to see if the optimizely_client variable has been intialized, if not it will run instantiate_optimizely method
    # Commenting this out temporarily to reinstantiate on every request for demo purposes
    # Uncomment line 44 and comment out line 45 to only instantiate Optimizely if it doesn't already exist
    # @@optimizely_client ||= instantiate_optimizely
    instantiate_optimizely
  end

  # Method used to instantiate the Optimizely client if it hasnt been defined or if it needs to be re-instantiated due to changes
  def instantiate_optimizely
    p 'Instantiating Client!'
    # Here we are accessing the datafile directly in S3 to ensure the most up to date datafile
    # Once the REST API is updated to use the latest (v4) version of the datafile, this will be updated to get the datafile via the API
    # Here we're grabbing the datafile direct from S3 vs the Optimizely CDN, this is to ensure the most up to date version of the datafile at all times 
    uri = URI("https://cdn.optimizely.com/datafiles/#{FULLSTACK_PROJECT_ID}.json")
    datafile = HTTParty.get(uri).body
    # Instantiates Class object that is shared across all controllers
    @@optimizely_client = Optimizely::Project.new(datafile, Optimizely::EventDispatcher.new, Optimizely::NoOpLogger.new)
  end

  def set_admin
    @administration = Administration.first
  end

  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  # Used to dynamically load an Optimizely Web project, this is not required for usage with Full Stack -- removing this for now because we don't need to include Web
  # def set_pid
  #   if params[:pid]
  #     p 'Setting project ID ' + params[:pid] + ' to cookie'
  #     cookies[:pid] = params[:pid]
  #     @project_id = params[:pid]
  #   elsif cookies[:pid]
  #     p 'Project ID stored in Cookie, using that!'
  #     @project_id = cookies[:pid]
  #   else
  #     p 'Using default snippet'
  #     @project_id = WEB_PROJECT_ID
  #   end
  # end
end
