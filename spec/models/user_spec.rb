require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'methods' do
    it "can return a list of unique topics" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user.studySessions.create(topic: "Cheese", duration: 5, paired: false)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.topics).to eq(['Ruby', 'Cake', 'Cheese', 'Books'])
    end

    it "can return total time study" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user.studySessions.create(topic: "Cheese", duration: 5, paired: false)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.total_time).to eq("00 hours and 30 minutes.")
    end

    it "can return paired time study" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Ruby", duration: 5, paired: true)
      user.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user.studySessions.create(topic: "Cheese", duration: 5, paired: true)
      user.studySessions.create(topic: "Books", duration: 5, paired: true)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.paired_time).to eq("00 hours and 15 minutes.")
    end

    it "can return a topics time study" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Ruby", duration: 5, paired: true)
      user.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user.studySessions.create(topic: "Cheese", duration: 5, paired: true)
      user.studySessions.create(topic: "Books", duration: 5, paired: true)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.topic_time("Ruby")).to eq("00 hours and 10 minutes.")
    end

    it "can return time related to topic while paired" do
      user = User.create(name: "bob", email: "faked", password: "password")
      user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user.studySessions.create(topic: "Ruby", duration: 5, paired: true)
      user.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user.studySessions.create(topic: "Cheese", duration: 5, paired: true)
      user.studySessions.create(topic: "Books", duration: 5, paired: true)
      user.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(user.paired_topic_time("Ruby")).to eq("00 hours and 05 minutes.")
    end

    it "can return a integer that is a percent of global study time" do
      user1 = User.create(name: "bob", email: "faked", password: "password")
      user1.studySessions.create(topic: "Ruby", duration: 15, paired: false)
      user2 = User.create(name: "bob", email: "faked", password: "password")
      user2.studySessions.create(topic: "Ruby", duration: 5, paired: false)
      user2.studySessions.create(topic: "Ruby", duration: 5, paired: true)
      user2.studySessions.create(topic: "Cake", duration: 5, paired: false)
      user2.studySessions.create(topic: "Cheese", duration: 5, paired: true)
      user2.studySessions.create(topic: "Books", duration: 5, paired: true)
      user2.studySessions.create(topic: "Books", duration: 5, paired: false)
      expect(user2.global_time).to eq(66.67)
    end

    it 'can convert minutes into a hour string' do
      user1 = User.create(name: "bob", email: "faked", password: "password")
      expect(user1.minutes_to_hours(65)).to eq("01 hours and 05 minutes.")
      expect(user1.minutes_to_hours(660)).to eq("11 hours and 00 minutes.")
      expect(user1.minutes_to_hours(5)).to eq("00 hours and 05 minutes.")
    end
  end
end
