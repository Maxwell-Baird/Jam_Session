# frozen_string_literal: true

class StudySession < ApplicationRecord
  validates :topic, presence: true
  validates :paired, inclusion: { in: [true, false] }
  validates :duration, presence: true
  belongs_to :user

  def self.topics
    StudySession.all.map(&:topic).uniq
  end
end
