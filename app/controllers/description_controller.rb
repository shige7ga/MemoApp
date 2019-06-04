class DescriptionController < ApplicationController
  def index
    @descriptions = Description.all.order(created_at: :desc)
  end
  
  def new
  end
  
  def create
    @description = Description.new(content: params[:content])
    @description.save
    redirect_to "/"
  end
end
