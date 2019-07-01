class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # action呼び出し時、実行される処理
  before_action :set_current_user
  
  # 現在ログインしているユーザのオブジェクト生成
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  # ログインしていない場合に、ログインを求めるメソッド
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to "/login"
    end
  end
  
  # ログインしている時、メモ一覧へリダイレクトするメソッド
  def forbit_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to descriptions_path
    end
  end
end
