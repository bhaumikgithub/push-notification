class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :own_notifications, class_name: "Notification", foreign_key: "user_id"
  has_many :notifications, foreign_key: :recipient_id

  scope :all_without, ->(user) { (where.not(id: user.id)) }
end
