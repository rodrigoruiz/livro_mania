class MyBook < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :user_id, :book_id
  
  #, :class_name => 'Book'
  #, :class_name => 'User'
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User'
end