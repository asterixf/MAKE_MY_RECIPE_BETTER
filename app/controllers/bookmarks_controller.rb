class BookmarksController < ApplicationController

    def index
        @bookmark = Bookmark.all
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        @bookmark = Bookmark.new
    end
end
