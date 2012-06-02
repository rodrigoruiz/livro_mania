class PagesController < ApplicationController
  autocomplete :book, :title
  
  def index
    if current_user
      @my_books = current_user.my_books.sort_by { |my_book| my_book.title }
      @desired_books = current_user.books.sort_by { |book| book.title }
      
      @thumbs_up = 0
      @thumbs_down = 0
      user_ratings = Rating.find_all_by_rated_user_id(current_user.id)
      user_ratings.each { |rating| (rating.vote) ? @thumbs_up += 1 : @thumbs_down += 1 }
    end
    
    @book = Book.new
  end
  
  def user_profile
    @user = User.find(params[:id])
    @my_books = @user.my_books.sort_by { |my_book| my_book.book.title }
    @desired_books = @user.books.sort_by { |book| book.title }
    @message = Message.new
    @rating = Rating.new
    
    @thumbs_up = 0
    @thumbs_down = 0
    user_ratings = Rating.where(:rated_user_id => @user.id)
    user_ratings.each { |rating| (rating.vote) ? @thumbs_up += 1 : @thumbs_down += 1 }
    
    current_user_rating = Rating.where(:evaluator_id => current_user.id, :rated_user_id => @user.id).first
    @current_user_vote = (current_user_rating.nil?) ? nil : current_user_rating.vote
  end
  
  def rate
    rating = Rating.find_or_create_by_evaluator_id_and_rated_user_id(params[:rating][:evaluator_id], params[:rating][:rated_user_id])
    params[:rating][:vote] = ((params[:thumbs_up]) ? true : false)
    rating.update_attributes(params[:rating])
    
    @thumbs_up = 0
    @thumbs_down = 0
    user_ratings = Rating.where(:rated_user_id => params[:rating][:rated_user_id])
    user_ratings.each { |rating| (rating.vote) ? @thumbs_up += 1 : @thumbs_down += 1 }
    
    @current_user_vote = rating.vote
  end
  
  def contact_us_form
  end
  
  def send_contact_us_email
    book_title =  params[:book_title]
    addicional_information = params[:addicional_information]
    UserMailer.new_book_requesting_email(current_user.email, book_title, addicional_information).deliver
    flash[:notice]="O livro #{book_title} foi solicitado."    
    redirect_to root_path
  end
end
