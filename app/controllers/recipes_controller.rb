class RecipesController < ApplicationController
  def index
    if params[:query].present?
      @recipes = Recipe.where(title: params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
end
