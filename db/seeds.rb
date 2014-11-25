Project.delete_all
Task.delete_all
User.delete_all
Membership.delete_all

50.times do
 User.create!(
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   email_address: Faker::Internet.email,
   password: "1234"
 )
end

23.times do
 project = Project.create!(name: Faker::Lorem.word)

 rand(15).times do
   task = Task.create!(
     project_id: project.id,
     description: Faker::Lorem.word,
     due: Faker::Date.forward(23)
   )
 end

 users = User.all
 rand(15).times do
   user = users.sample
   member = Membership.new(
     user_id: user.id,
     project_id: project.id,
     role: ["Member", "Owner"].sample,
   )
   if member.save
   end
 end
end
