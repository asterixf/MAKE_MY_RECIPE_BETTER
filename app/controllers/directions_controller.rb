class DirectionsController < ApplicationController
  def create
    @direction = Direction.new(direction_params)
    if @direction.save
      redirect_to @direction.recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def direction_params
    params.require(:direction).permit(:step, :recipe_id)
  end
end
