class PagesController < ApplicationController
  def index
    #@my_books = current_user.my_books
    @my_books = []
    @desired_books = current_user.books if current_user
  end
end
