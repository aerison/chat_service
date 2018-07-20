class Admission < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room ,counter_cache: true  #admission_count라는 곳에 캐싱되어있게됨.


  after_commit :join_chat_room_notification , on: :create
  def join_chat_room_notification
      Pusher.trigger('chat_room','join',self.as_json)
      Pusher.trigger("chat_room_#{self.chat_room_id}", 'join',
      self.as_json.merge({email: self.user.email}))   #해시를합쳐줌
      #show의 메세징타게팅으로감
  end
end
