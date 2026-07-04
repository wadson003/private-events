class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :created_events, class_name: "Event", foreign_key: "creator_id", dependent: :destroy
         has_many :attendances, foreign_key: "attendee_id"
         has_many :attendee_events, through: :attendances, source: :attended_event
end
