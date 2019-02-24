class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:show, :update, :destroy, :index, :new], :if => lambda{ Rails.env.test?}
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
    if @user.role.eql? "Customer"
      @user.is_customer = 1
      @user.is_agent = 0
    else
      @user.is_customer = 0
      @user.is_agent = 1
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.role.eql? "Customer"
      @user.is_customer = 1
      @user.is_agent = 0
    else
      @user.is_customer = 0
      @user.is_agent = 1
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def customer
    #Remove ! from user_signed_in when adding check for admin
    if !user_signed_in? #&& !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    @users= User.where(is_customer: 1)
  end

  def agent 
    #Remove ! from user_signed_in when adding check for admin
    if !user_signed_in? #&& !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    @users= User.where(is_agent: 1)
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

  def update
    if @user.role.eql? "Customer"
      @user.is_customer = 1
      @user.is_agent = 0
    else
      @user.is_customer = 0
      @user.is_agent = 1
    end
    respond_to do |format|
      if @user.update_without_password(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end

def validate_user
  if !user_signed_in?
    redirect_to root_path
  end

  if @user != @current_user
    redirect_to root_path
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
      params.require(:user).permit(:first_name, :last_name, :role, :email, :is_customer, :phone_number, :is_agent, :password, :password_confirmation)
    end
end
