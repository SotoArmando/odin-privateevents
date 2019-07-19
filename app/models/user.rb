class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: 'Event'
  has_many :attending_events, foreign_key: :attendee_id, class_name: 'EventAttendance'
  has_many :attended_events, through: :attending_events
  scope :all_users_names, -> { User.all.map {|u| [ u.name , u.id] }}
end
