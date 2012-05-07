class Book < ActiveRecord::Base
  # attr_accessible :title, :body
  
  #criado por Heitor
  attr_accessible :author, :cpf, :edition, :isbn, :language, :pages, :publisher, :title
  has_and_belongs_to_many :users
end
