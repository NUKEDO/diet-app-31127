class MethodsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def new
    @diet_method = DietMethod.new
  end

  def create
    @diet_method = DietMethod.new(diet_method_params)
  end

  private

  def diet_method_params
    params.require(:diet_method).permit(:title, :type_id, :explanation, :ease_of_reduction, :ease_of_continuation).merge(user_id: current_user.id)
  end
end
