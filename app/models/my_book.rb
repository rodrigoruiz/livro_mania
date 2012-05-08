class MyBook < ActiveRecord::Base
<<<<<<< HEAD
  # attr_accessible :title, :body

  attr_accessible :user_id, :book_id
  
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User'
end
