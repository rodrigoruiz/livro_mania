class MyBook < ActiveRecord::Base
<<<<<<< HEAD
  # attr_accessible :title, :body

  attr_accessible :user_id, :book_id
  
  #, :class_name => 'Book'
  #, :class_name => 'User'
=======
>>>>>>> 940e0d3c96d2facac288d6e4b37484bf1d157e1c
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User'
end
