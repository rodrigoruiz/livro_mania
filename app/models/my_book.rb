class MyBook < ActiveRecord::Base
  # attr_accessible :title, :body
  
  
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User'
end