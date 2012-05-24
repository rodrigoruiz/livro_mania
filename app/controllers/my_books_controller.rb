class MyBooksController < ApplicationController
  autocomplete :book, :title
  def find
    
    books = Book.find_all_by_title(params[:search_string])
    books.each do |book|
      @my_books = MyBook.find_all_by_book_id(book.id)
    end

    if user_signed_in?
      @my_books.sort_by! { |my_book| current_user.distance_to(my_book.owner) }
    end
  end

  def max_trocas
    @users = User.find(:all)
    @users.sort_by! { |user| -current_user.max_trocas(user) }  
  end

end
