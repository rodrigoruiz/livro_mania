class UserMailer < ActionMailer::Base
  default from: "the_owner@livromania.com"
  
  def missing_book_notification_email(user, book)
    @user = user
    @book = book
    mail(:to => user.email, :subject => 'Seu livro está disponível no LivroMania')
  end
end
