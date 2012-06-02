#encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: 'livromaniaita@gmail.com'
  
  def missing_book_notification_email(user, book)
    @user = user
    @book = book
    mail(:to => user.email, :subject => 'Seu livro está disponível no LivroMania')
  end
  
  def new_book_requesting_email(user_email, book_title, addicional_information)
    @book_title = book_title
    @addicional_information = addicional_information 
    mail(:to => 'livromaniaita@gmail.com', :from=> user_email, :subject => 'Solicitação de livro')    
  end
end
