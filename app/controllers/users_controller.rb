class UsersController < ApplicationController
  before_action :read_user, only: [:show, :edit]
  def index
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
     if @user.save
      flash[:success] = "Welcome to the My Blog!"
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  private

  def read_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      redirect_to root_url
    end
  end
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

end
