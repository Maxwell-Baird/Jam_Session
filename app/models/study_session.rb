class StudySession < ApplicationRecord
  validates :topic, presence: true
  validates :paired, inclusion: { in: [true, false] }
  validates :duration, presence: true
  belongs_to :user

  def self.topics
    StudySession.all.map do |session|
      session.topic
    end.uniq
  end
end
