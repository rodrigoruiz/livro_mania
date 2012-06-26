#encoding: utf-8

class MyBooksController < ApplicationController
  autocomplete :book, :title
  
  def find
    @book = Book.find_by_title(params[:search_string])
    if @book

      @my_books = MyBook.find_all_by_book_id(@book.id)
      
      @my_books.delete_if { |my_book| my_book.owner == current_user }
      if user_signed_in?
        @lat1 = current_user.latitude
        @lon1 = current_user.longitude
        @lat2 = current_user.latitude
        @lon2 = current_user.longitude
      end

      @my_books.sort_by! { |my_book| current_user.distance_to(my_book.owner) } if user_signed_in?
    else
      redirect_to root_path, :alert => "Livro não encontrado."
    end
  end
  
  def map 
    @lat1 = -23.5 #current_user.latitude
    @lon1 = -43.4 #current_user.longitude
    @lat2 = -23.8 #User.find(params[:user_id]).latitude
    @lon2 = -43.8 #User.find(params[:user_id]).longitude
    @lat1 = current_user.latitude
    @lon1 = current_user.longitude
    @lat2 = User.find(params[:user_id]).latitude
    @lon2 = User.find(params[:user_id]).longitude
  end
  
  def find_user
    @users = User.find_all_by_name(params[:search_string2])
    if !params[:exato]
      @users = User.find(:all)
      @users.delete_if{|user| !(user.name.include? params[:search_string2])}   
    end
    @users.sort_by! { |user| current_user.distance_to(user) } if user_signed_in?
  end
  
  def find_advanced
    @my_books = MyBook.find(:all)
    if(params[:opcao] == 'Autor')
      @my_books.delete_if { |my_book| !my_book.author.include?(params[:search_string3]) }
    elsif(params[:opcao] == 'Titulo')
      @my_books.delete_if { |my_book| !my_book.title.include?(params[:search_string3]) }
    end
    
    @my_books.delete_if { |my_book| (current_user.distance_to(my_book.owner) > params[:disFilter].to_f) } if params[:filtro]
    
    @my_books.delete_if { |my_book| (my_book.language == "Português") } if !params[:Portugues]
    @my_books.delete_if { |my_book| (my_book.language == "Inglês")} if !params[:Ingles]
    @my_books.delete_if { |my_book| (my_book.language != "Inglês" && my_book.language != "Português")} if !params[:Outras]
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
    if my_book.book
      my_book.owner = current_user
      my_book.save
      
      check_missing_book_notification(my_book.book)
      
      redirect_to root_path
    else
      redirect_to new_my_book_path, :alert => "Livro não encontrado."      
    end
  end
  
  def remove_my_book
    MyBook.find(params[:id]).destroy
    redirect_to root_path
  end
  
  def add_desired_book
    book = Book.where(:title => params[:book][:title]).first
    
    if book
      current_user.books << book if !current_user.books.include?(book)
      redirect_to root_path
    else
      redirect_to root_path, :alert => "Livro não encontrado."
    end
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
      MissingBookNotification.find_all_by_book_id(book.id).each do |missing_book_notification|
        UserMailer.missing_book_notification_email(missing_book_notification.user, book).deliver
        missing_book_notification.destroy
      end
    end
end
