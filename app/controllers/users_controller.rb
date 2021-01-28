class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :index, :edit, :update]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if !session[:user_id]
      redirect_to '/login'
    end
    # Logged in user id
    user_id = session[:user_id].to_s

    attributes = {
      'high_value' => true
    }

    # Enables feature flag and gets live variable values
    @enabled = optimizely_obj.is_feature_enabled('offer_signup', user_id, attributes)
    p @enabled
    @interest_rate_discount = optimizely_obj.get_feature_variable_double('offer_signup', 'interest_rate_discount', user_id)
    p @interest_rate_discount
    @message = optimizely_obj.get_feature_variable_string('offer_signup', 'message', user_id)
    p @message 
    @img_url = optimizely_obj.get_feature_variable_string('offer_signup', 'img_url', user_id)
    p @img_url
    @call_to_action = optimizely_obj.get_feature_variable_string('offer_signup', 'call_to_action', user_id)
    p @call_to_action
    @user = User.find(session[:user_id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def require_login
      unless session[:user_id]
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login' # halts request cycle
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
