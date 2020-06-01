class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :study_sessions

  has_secure_password

  def total_time
    study_sessions.sum(:duration)
  end

  def paired_time
    study_sessions.where(paired: true).sum(:duration)
  end

  def topics
    study_sessions.all.map do |session|
      session.topic
    end.uniq
  end

  def topic_time(topic)
    study_sessions.where(topic: topic).sum(:duration)
  end

  def paired_topic_time(topic)
    study_sessions.where(topic: topic, paired: true).sum(:duration)
  end

  def global_time
    your_time = total_time * 100
    global = StudySession.sum(:duration)
    your_time / global
  end

end
