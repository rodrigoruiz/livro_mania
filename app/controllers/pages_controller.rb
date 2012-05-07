class PagesController < ApplicationController
  def index
    #@my_books = current_user.my_books
    @my_books = []
    @desired_books = current_user.books
  end
end
