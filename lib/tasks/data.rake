desc "Create large amount of data"
task :data => [:environment] do
  puts "start"
  StudySession.destroy_all
  User.destroy_all
  puts "destroy everything"
  count = 0
  1000.times do
    count += 1
    user = User.create(
      name: 'Pablo D',
      email: "#{count}@example.com",
      password: 'password'
    )
    10.times do
      user.study_sessions.create(topic: "Ruby", duration: 50, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 30, paired: true)
      user.study_sessions.create(topic: "Cake", duration: 75, paired: true)
      user.study_sessions.create(topic: "Cheese", duration: 15, paired: false)
      user.study_sessions.create(topic: "Books", duration: 55, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 50, paired: false)
      user.study_sessions.create(topic: "Ruby", duration: 30, paired: true)
      user.study_sessions.create(topic: "Cake", duration: 75, paired: true)
      user.study_sessions.create(topic: "Cheese", duration: 15, paired: false)
      user.study_sessions.create(topic: "Books", duration: 55, paired: false)
    end
    puts "#{count}"
  end

  user = User.create(
    name: 'Pablo D',
    email: "massive@example.com",
    password: 'password'
  )
  1000.times do
    user.study_sessions.create(topic: "Ruby", duration: 60, paired: false)
    user.study_sessions.create(topic: "Ruby", duration: 60, paired: true)
    user.study_sessions.create(topic: "Cake", duration: 60, paired: true)
    user.study_sessions.create(topic: "Cheese", duration: 60, paired: false)
    user.study_sessions.create(topic: "Books", duration: 60, paired: false)
    user.study_sessions.create(topic: "Ruby", duration: 60, paired: false)
    user.study_sessions.create(topic: "Ruby", duration: 60, paired: true)
    user.study_sessions.create(topic: "Cake", duration: 60, paired: true)
    user.study_sessions.create(topic: "Cheese", duration: 60, paired: false)
    user.study_sessions.create(topic: "Books", duration: 60, paired: false)
    puts "study has been made"
  end
end
