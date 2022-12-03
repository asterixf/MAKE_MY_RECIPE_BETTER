class DirectionsController < ApplicationController
  def create
    @direction = Direction.new(direction_params)
    if @direction.save
      flash[:notice] = "Step was saved succesfuly"
    else
      flash[:alert] = @direction.errors.full_messages.join(", ")
    end
    redirect_to @direction.recipe
  end

  def edit
    @direction = Direction.find(params[:id])
  end

  def update
    @direction = Direction.find(params[:id])
    @direction.update(direction_params)
    redirect_to @direction.recipe
  end

  def destroy
    @direction = Direction.find(params[:id])
    recipe = @direction.recipe
    @direction.destroy
    redirect_to recipe
  end

  private

  def direction_params
    params.require(:direction).permit(:step, :recipe_id)
  end
end
