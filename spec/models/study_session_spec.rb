require 'rails_helper'

RSpec.describe StudySession, type: :model do

  describe 'methods' do
    it "can return a list of unique topics" do
      user = User.create(name: "bob", email: "faked")
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user.studySessions.create(topic: "Cheese", duration: 5, paired: false)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(StudySession.topics).to eq(['Ruby', 'Cake', 'Cheese', 'Books'])
    end
  end
end
