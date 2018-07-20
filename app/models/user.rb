class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #채팅이랑 1:n
  has_many :chats
  #챗룸이랑 m:n
  has_many :admissions
  has_many :chat_rooms, through: :admissions
end
