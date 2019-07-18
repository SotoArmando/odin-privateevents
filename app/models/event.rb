class Event < ApplicationRecord
  belongs_to :creator ,class_name: 'User'
  has_many :attending_people, foreign_key: :attended_event_id, class_name: 'EventAttendance'
  has_many :attendees, through: :attending_people

  scope :up_coming, -> {where('date > ?', Time.now)}
  scope :past, -> {where('date < ?',Time.now)}


  def finished?
    self.date > Time.now
  end

  def past?
    self.date < Time.now
  end

  def up_coming?
    self.date > Time.now
  end
end
