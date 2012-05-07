class Message < ActiveRecord::Base
  #attr_accessible :title, :body
  
  #criado por Heitor
  attr_accessible :body
  
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
  
end
