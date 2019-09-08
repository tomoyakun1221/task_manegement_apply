# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
100.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@sample.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
            
users = User.order(:created_at).take(3)
50.times do |n|
  task_name = "タスク#{n+1}"
  task_detail = "タスク詳細#{n+1}"
  users.each { |user| user.tasks.create!(task_name: task_name,
                                         task_detail: task_detail) }
end