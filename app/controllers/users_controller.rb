class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!
  before_action :authenticate_charity, only: [:premium_purchase]
  before_action :authenticate_admin, only: [:index]
  # GET /users
  # GET /users.json
  def index
    @volunteers = User.with_role(:volunteer)
    @charities = User.with_role(:charity)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.has_role? :volunteer
      @skills = @user.skills.all
      @jobs = Job.includes(:users).where(users: { id: @user.id })
      render 'volunteer_show'

    elsif @user.has_role? :charity || :premium_charity
      @jobs = Job.where('user_id = ? ', @user.id)
      render 'charity_show'
  end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
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

  def premium_purchase
    @user = User.find(params[:user])
    @user.add_role(:premium) if @user.has_role? :charity
    redirect_to @user
  end

  def authenticate_charity
    redirect_to root_path, alert: 'You must be a charity to do this.' unless current_user.has_role?(:charity)
  end

  def authenticate_admin
    redirect_to root_path, alert: 'You must be an admin to do this.' unless current_user.has_role?(:admin)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :company_name, :bio, :phone, :street, :city, :country, :postcode, :chosen_role, :image)
  end
end
