class ChatRoom < ActiveRecord::Base
  #chat 1:n
  has_many :chats
  #user M:N , admission
  has_many :users, through: :admissions
  has_many :admissions, dependent: :destroy


  after_commit :create_chat_room_notification, on: :create
  after_commit :destroy_chat_room_notificatioin, on: :destroy
  def create_chat_room_notification
      #Pusher.trigger(채널명, 이벤트명, 정보:json)
      Pusher.trigger('chat_room','create',self.as_json)
  end
  #Chatroom.find(1)을 제이슨으로 바꿔라
  def destroy_chat_room_notificatioin
      Pusher.trigger('chat_room','destroy',self.as_json)
      Pusher.trigger("chat_room_#{self.id}",'destroy',{})

  end
end
