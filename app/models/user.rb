class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :mk_room
  belongs_to :list
  has_many :chat
  belongs_to :univ
  
  validates :email, :student_name, presence: true, uniqueness: true
end
