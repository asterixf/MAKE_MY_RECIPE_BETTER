class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
