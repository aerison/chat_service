class Admission < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room ,counter_cache: true  #admission_count라는 곳에 캐싱되어있게됨.
end
