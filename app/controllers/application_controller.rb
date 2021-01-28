class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :split_obj, :set_user

  include SessionsHelper
  include HTTParty
  require 'uri'
  require 'splitclient-rb'

  LOCAL_KEY = 'pq0ae329mjce4lp2amcmn9dbhb39dutk0hi'
  split_key = 'finserv-promo'

  def update_split
    instantiate_split
  end
  
  private
  
  # Method used to determine if Split client has been defined yet
  def split_obj
    p 'Checking to see if Split client exists'
    instantiate_split
  end

  # Method used to instantiate the Split client if it hasnt been defined or if it needs to be re-instantiated due to changes
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

  def set_admin
    @administration = Administration.first
  end

  def set_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end
