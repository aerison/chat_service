class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room

  after_commit :chat_message_notification, on: :create
  def chat_message_notification
    Pusher.trigger("chat_room_#{self.chat_room_id}", #chatroom name
      'chat', #event
      self.as_json.merge({email: self.user.email})) #data

  end
end
