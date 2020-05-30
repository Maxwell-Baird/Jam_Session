class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :studySessions

  has_secure_password

  def total_time
    studySessions.sum(:duration)
  end

  def paired_time
    studySessions.where(paired: true).sum(:duration)
  end

  def topics
    studySessions.all.map do |session|
      session.topic
    end.uniq
  end

  def topic_time(topic)
    studySessions.where(topic: topic).sum(:duration)
  end

  def paired_topic_time(topic)
    studySessions.where(topic: topic, paired: true).sum(:duration)
  end

  def global_time
    your_time = total_time * 100
    global = StudySession.sum(:duration)
    your_time / global
  end

end
