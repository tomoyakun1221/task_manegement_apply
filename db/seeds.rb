# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
            
@users = User.order(:created_at).take(3)
50.times do
  task_name = Faker::Lorem.sentence(1)
  task_detail = Faker::Lorem.sentence(2)
  @users.each { |user| user.tasks.create!(task_name: task_name,
                                          task_detail: task_detail) }
end