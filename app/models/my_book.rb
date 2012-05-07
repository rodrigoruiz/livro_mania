class MyBook < ActiveRecord::Base
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User'
end
