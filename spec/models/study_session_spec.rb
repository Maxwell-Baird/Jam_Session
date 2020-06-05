# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudySession, type: :model do
  describe 'methods' do
    it 'can return a list of unique topics' do
      user = User.create(name: 'bob', email: 'faked', password: 'password')
      user.study_sessions.create(topic: 'Ruby', duration: 5, paired: false)
      user.study_sessions.create(topic: 'Ruby', duration: 5, paired: false)
      user.study_sessions.create(topic: 'Cake', duration: 5, paired: false)
      user.study_sessions.create(topic: 'Cheese', duration: 5, paired: false)
      user.study_sessions.create(topic: 'Books', duration: 5, paired: false)
      user.study_sessions.create(topic: 'Books', duration: 5, paired: false)
      expect(StudySession.topics).to eq(%w[Ruby Cake Cheese Books])
    end
  end
end
