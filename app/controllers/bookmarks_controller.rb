class BookmarksController < ApplicationController

    def index
        bookmarks = current_user.bookmarks
        @recipes = []
        bookmarks.each do |bookmark|
            @recipes.push(bookmark.recipe)
        end 
        
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        @bookmark = Bookmark.new
    end

     def create
        @user = current_user
        @recipe = Recipe.find(params[:recipe_id])
        @bookmark = Bookmark.new(user: @user, recipe: @recipe)
        @bookmark.save
        redirect_to recipe_path(@recipe)
     end

     def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.destroy
     end
end
