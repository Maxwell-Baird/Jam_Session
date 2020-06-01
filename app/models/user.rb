class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :studySessions

  has_secure_password

  def total_time
    time = studySessions.sum(:duration)
    minutes_to_hours(time)
  end

  def paired_time
    time = studySessions.where(paired: true).sum(:duration)
    minutes_to_hours(time)
  end

  def topics
    studySessions.all.map do |session|
      session.topic
    end.uniq
  end

  def topic_time(topic)
    time = studySessions.where(topic: topic).sum(:duration)
    minutes_to_hours(time)
  end

  def paired_topic_time(topic)
    time = studySessions.where(topic: topic, paired: true).sum(:duration)
    minutes_to_hours(time)
  end

  def global_time
    your_time = studySessions.sum(:duration) * 100
    global = StudySession.sum(:duration)
    number = your_time / global.to_f
    number.round(2)
  end

  def minutes_to_hours(minutes_params)
    hours = minutes_params / 60
    minutes = minutes_params % 60
    hours_string = hours.to_s.rjust(2, "0")
    minutes_string = minutes.to_s.rjust(2, "0")
    "#{hours_string} hours and #{minutes_string} minutes."
  end

end
