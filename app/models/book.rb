class Book < ActiveRecord::Base
  attr_accessible :isbn, :title, :author, :edition, :language, :pages, :publisher
  has_and_belongs_to_many :users
end
