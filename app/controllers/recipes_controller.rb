class RecipesController < ApplicationController
  def index
    if params[:query].present?
      @recipe = Recipe.where(title: params[:query])
    else
      @recipe = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
end
