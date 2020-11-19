class MethodsController < ApplicationController
  def new
    @diet_method = DietMethod.new
  end

  def create
    @diet_method = DietMethod.new(diet_method_params)
  end

  private

  def diet_method_params
    params.require(:diet_method).permit().merge(user_id: current_user.id)
  end
end
