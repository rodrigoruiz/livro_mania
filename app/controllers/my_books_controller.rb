#encoding: utf-8

class MyBooksController < ApplicationController
  autocomplete :book, :title
  
  def find
    @book = Book.find_by_title(params[:search_string])
    @my_books = MyBook.find_all_by_book_id(@book.id)
    @my_books.sort_by! { |my_book| current_user.distance_to(my_book.owner) } if user_signed_in?
  end
  
  def max_trocas
    @users = User.find(:all)
    @users.sort_by! { |user| -current_user.max_trocas(user) }
  end
  
  def new_my_book
    @my_book = MyBook.new
    @my_book.book = Book.new
  end
  
  def create_my_book
    title = params[:my_book][:title]
    params[:my_book].delete(:title)
    my_book = MyBook.new(params[:my_book])
    my_book.book = Book.find_by_title(title)
    my_book.owner = current_user
    my_book.save
    
    check_missing_book_notification(my_book.book)
    
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
  
  def add_missing_book_notification
    MissingBookNotification.create(:user => current_user, :book => Book.find(params[:book_id]))
    flash[:notice]='Você receberá um email quando este livro estiver disponível.'
    redirect_to root_path
  end
  
  private
    def check_missing_book_notification(book)
      MissingBookNotification.find_by_book_id(book.id).each do |missing_book_notification|
        UserMailer.missing_book_notification_email(missing_book_notification.user, book).deliver
        missing_book_notification.destroy
      end
    end
end
