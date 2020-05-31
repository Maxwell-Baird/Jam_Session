require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'methods' do
    it "can return a list of unique topics" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cake", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cheese", duration: 5, paired: false)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.topics).to eq(['Ruby', 'Cake', 'Cheese', 'Books'])
    end

    it "can return total time study" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cake", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cheese", duration: 5, paired: false)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.total_time).to eq(30)
    end

    it "can return paired time study" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: true)
      user.study_sessions.create(topic: "Cake", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cheese", duration: 5, paired: true)
      user.study_sessions.create(topic: "Books", duration: 5, paired: true)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.paired_time).to eq(15)
    end

    it "can return a topics time study" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: true)
      user.study_sessions.create(topic: "Cake", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cheese", duration: 5, paired: true)
      user.study_sessions.create(topic: "Books", duration: 5, paired: true)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.topic_time("Ruby")).to eq(10)
    end

    it "can return time related to topic while paired" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 5, paired: true)
      user.study_sessions.create(topic: "Cake", duration: 5, paired: false)
      user.study_sessions.create(topic: "Cheese", duration: 5, paired: true)
      user.study_sessions.create(topic: "Books", duration: 5, paired: true)
      user.study_sessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.paired_topic_time("Ruby")).to eq(5)
    end

    it "can return a integer that is a percent of global study time" do
      user1 = User.create(name: "bob", email: "faked", password: "password")
      user1.study_sessions.create(topic: "Ruby", duration: 15, paired: false)
      user2 = User.create(name: "bob", email: "faked", password: "password")
      user2.study_sessions.create(topic: "Ruby", duration: 5, paired: false)
      user2.study_sessions.create(topic: "Ruby", duration: 5, paired: true)
      user2.study_sessions.create(topic: "Cake", duration: 5, paired: false)
      user2.study_sessions.create(topic: "Cheese", duration: 5, paired: true)
      user2.study_sessions.create(topic: "Books", duration: 5, paired: true)
      user2.study_sessions.create(topic: "Books", duration: 5, paired: false)
      expect(user2.global_time).to eq(66)
    end
  end
end
