class RecipesController < ApplicationController
  def index
    if params[:query].present?
      @recipes = Recipe.where("lower(name) LIKE ?", "%" + params[:query].downcase + "%")
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_variations = Recipe.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
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
    redirect_to recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    if params[:recipe][:recipe_id]
    params.require(:recipe).permit(:name, :photo, :ingredients, :directions, :variation_status, :recipe_id)
    else
    params.require(:recipe).permit(:name, :photo, :ingredients, :directions, :variation_status)
    end
  end
end
