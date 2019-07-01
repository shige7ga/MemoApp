class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:index, :show, :edit, :update, :destroy, :logout]
  before_action :forbit_login_user, only: [:new, :create, :login, :login_form]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
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
      session[:user_id] = @user.id
      flash[:notice] = "ユーザーを登録しました"
      redirect_to descriptions_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザー詳細を更新しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to users_path
  end
  
  # ログイン関連アクション=============================
  def login_form
  end
  
  def login
    @user = User.find_by(email: user_params[:email], password: user_params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to descriptions_path
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = user_params[:email]
      render "users/login_form"
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to "/login"
  end
  
  # privateメソッド ===================================
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
    
    # ユーザ編集・削除が可能なユーザか確かめるメソッド
    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to descriptions_path
      end
    end
end