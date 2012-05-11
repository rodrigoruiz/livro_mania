class Book < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :isbn, :title, :author, :edition, :language, :pages, :publisher

  has_many :my_books, :class_name => 'MyBook'

  attr_accessible :isbn, :title, :author, :edition, :language, :pages, :publisher

  has_and_belongs_to_many :users
end
