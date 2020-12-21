class MethodsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def new
    @diet_method = DietMethod.new
  end

  def create
    @diet_method = DietMethod.new(diet_method_params)
    if @diet_method.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @diet_method = DietMethod.find(params[:id])
  end

  private

  def diet_method_params
    params.require(:diet_method).permit(:title, :type_id, :explanation, :ease_of_reduction, :ease_of_continuation).merge(user_id: current_user.id)
  end
end
