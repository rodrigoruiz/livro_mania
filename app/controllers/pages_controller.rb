class PagesController < ApplicationController
  def index
    if current_user
      @my_books = current_user.my_books.sort_by { |my_book| my_book.book.title }
      @desired_books = current_user.books.sort_by { |book| book.title }
    end
    
    @book = Book.new
  end
  
  def add_my_book
    book = Book.where(:title => params[:book][:title]).first
    if book
      my_book = MyBook.new
      my_book.book = book
      my_book.owner = current_user
      my_book.save
    end
    
    redirect_to root_path
  end
  
  def remove_my_book
    MyBook.find(params[:id]).destroy
    
    redirect_to root_path
  end
  
  def add_desired_book
    book = Book.where(:title => params[:book][:title]).first
    current_user.books << book if book && !current_user.books.include?(book)
    
    redirect_to root_path
  end
  
  def remove_desired_book
    current_user.books.delete(Book.find(params[:id]))
    
    redirect_to root_path
  end
end
