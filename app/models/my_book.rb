class MyBook < ActiveRecord::Base
  attr_accessible :weight, :additional_information, :photo
  
  validates :user_id, :presence => true
  validates :book_id, :presence => true
  
  belongs_to :book, :class_name => 'Book'
  belongs_to :owner, :class_name => 'User', :foreign_key => 'user_id'
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  delegate :isbn, :to => :book
  delegate :title, :to => :book
  delegate :author, :to => :book
  delegate :edition, :to => :book
  delegate :language, :to => :book
  delegate :pages, :to => :book
  delegate :publisher, :to => :book
end
