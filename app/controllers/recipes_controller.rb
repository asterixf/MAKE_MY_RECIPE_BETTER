class RecipesController < ApplicationController
  def index
    if params[:query].present?
      @recipes = Recipe.includes(:reviews, photo_attachment: :blob).where("lower(name) LIKE ?", "%" + params[:query].downcase + "%")
    else
      @recipes = Recipe.includes(:reviews, photo_attachment: :blob).all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_variations = Recipe.where(recipe_id: @recipe.id)
    @ingredients = decorate_ingredients(@recipe.ingredients)
  end

  def new
    @recipe = Recipe.new
    @recipe.directions.build
    @old_recipe = Recipe.find(params[:variation]) if params[:variation]
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    if params[:recipe][:recipe_id]
      params.require(:recipe).permit(:name, :photo, :ingredients, :variation_status, :recipe_id)
    else
      params.require(:recipe).permit(:name, :photo, :ingredients, :variation_status,
                                     directions_attributes: [:id, :step, :_destroy])
    end
  end
end
