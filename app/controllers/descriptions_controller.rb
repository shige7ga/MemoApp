class DescriptionsController < ApplicationController
  before_action :set_description, only: [:show, :edit, :destroy, :update]
  before_action :set_impotanceValues, only: [:new, :create, :edit, :update]
  before_action :authenticate_user
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @descriptions = Description.all.order(created_at: :desc)
  end
  
  def show
    @user = User.find_by(id: @description.user_id)
  end
  
  def new
    @description = Description.new
    @description.importance = 1
  end
  
  def create
    @description = Description.new(description_params)
    @description.user_id = @current_user.id
    if description_params[:memoTitle].empty?
      @description.memoTitle = "タイトルなし"
    end
    if @description.save
      flash[:notice] = "メモを投稿しました"
      #"/descriptions"へリダイレクト
      redirect_to descriptions_path
    else
      render :new
    end
  end
  
  def destroy
    @description.destroy
    flash[:notice] = "メモを削除しました"
    redirect_to descriptions_path
  end
  
  def edit
  end
  
  def update
    if @description.update(description_params)
      flash[:notice] = "メモを更新しました"
      redirect_to descriptions_path
    else
      render :edit
    end
  end
  
  def allDelete
    @descriptions = []
    params[:allDeleteDescriptions].each do |deleteId, checkedId|
      if checkedId == "1"
        @descriptions.push(Description.find_by(id: deleteId))
      end
    end
    if @descriptions.blank?
      flash[:notice] = "削除対象のメモが選択されていません"
    else
      @descriptions.each do |description|
        description.destroy
      end
      flash[:notice] = "選択したメモを一括削除しました"
    end
    redirect_to user_path(@current_user)
  end
end

private
  def set_description
    @description = Description.find(params[:id])
  end
  
  def set_impotanceValues
    @importanceValues = [1, 2, 3, 4, 5]
  end
  
  def description_params
    params.require(:description).permit(:memoTitle, :importance, :content)
  end
  
  def ensure_correct_user
    @description = Description.find(params[:id])
    if @description.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to descriptions_path
    end
  end