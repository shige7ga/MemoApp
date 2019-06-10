class DescriptionController < ApplicationController
  def index
    @descriptions = Description.all.order(created_at: :desc)
  end
  
  def new
    @description = Description.new
    @importanceValues = [1, 2, 3, 4, 5]
  end
  
  def create
    @description = Description.new(
      content: params[:content],
      importance: params[:importance].to_i
      )
    if params[:memoTitle].empty?
      @description.memoTitle = "タイトルなし"
    else
      @description.memoTitle = params[:memoTitle]
    end
    if @description.save
      redirect_to "/"
    else
      render "description/new"
    end
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
    @importanceValues = [1, 2, 3, 4, 5]
  end
  
  def update
    @description = Description.find_by(id: params[:id])
    @description.memoTitle = params[:memoTitle]
    @description.importance = params[:importance]
    @description.content = params[:content]
    if @description.save
      redirect_to "/"
    else
      render "description/edit"
    end
  end
end