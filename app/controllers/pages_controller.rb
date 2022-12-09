class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @recipes = Recipe.includes(:reviews, photo_attachment: :blob).all.sample(12)
  end

  def show
    @recipes = Recipe.where(user:current_user)
  end
end
