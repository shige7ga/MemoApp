class DescriptionController < ApplicationController
  def index
    @descriptions = Description.all.order(created_at: :desc)
  end
  
  def new
  end
  
  def create
    @description = Description.new(content: params[:content])
    if params[:memoTitle].empty?
      @description.memoTitle = "タイトルなし"
    else
      @description.memoTitle = params[:memoTitle]
    end
    @description.save
    redirect_to "/"
  end
  
  def details
    @description = Description.find_by(id: params[:id])
  end
  
  def delete
    @description = Description.find_by(id: params[:id])
    @description.destroy
    redirect_to "/"
  end
  
  def edit
    @description = Description.find_by(id: params[:id])
  end
  
  def update
    @description = Description.find_by(id: params[:id])
    @description.content = params[:content]
    @description.save
    redirect_to "/"
  end
end