class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to descriptions_path
    else
      render :new
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email)
    end
end