class DescriptionsController < ApplicationController
  before_action :set_description, only: [:show, :edit, :destroy, :update]
  before_action :set_impotanceValues, only: [:new, :create, :edit, :update]
  before_action :authenticate_user
  
  def index
    @descriptions = Description.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def new
    @description = Description.new
    @description.importance = 1
  end
  
  def create
    @description = Description.new(description_params)
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
    params[:allDeleteDescriptions].each do |deleteId, checkedId|
      if checkedId == "1"
        @description = Description.find_by(id: deleteId)
        @description.destroy
      end
    end
    flash[:notice] = "選択したメモを一括削除しました"
    redirect_to descriptions_path
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