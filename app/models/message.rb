class Message < ActiveRecord::Base
  attr_accessible :body, :sender_id, :receiver_id
  
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
end
