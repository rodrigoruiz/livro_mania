class MessagesController < ApplicationController
  def messages
    messages = Message.where("sender_id = #{current_user.id} OR receiver_id = #{current_user.id}")
    messages.sort_by! { |message| message.created_at }
    
    @messages = {}
    messages.each do |message|
      if message.sender == current_user
        @messages[message.receiver] ||= []
        @messages[message.receiver] << message
      else
        @messages[message.sender] ||= []
        @messages[message.sender] << message
      end
    end
    
    @message = Message.new
  end
end
