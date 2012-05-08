class MyBook < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :book_id, :presence => true
  
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
end
