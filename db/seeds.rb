require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld",
    role: "standard"
  )
  user.skip_confirmation!
  user.save!
end

user = User.new(
  name: "Ellen",
  email: "llnwlfsn@gmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  role: "admin"
)
  user.skip_confirmation!
  user.save!

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld",
    role: "premium"
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Wikis
50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
)
end

50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    personal: true
  )
end
wikis = Wiki.all

wikis.each do |w|
  Relationship.create!(
    user: users.sample,
    wiki: wikis.sample,
    creator_created: true
  )
relationships = Relationship.all

end
    
  puts "Seed finished"
  puts "#{wikis.count} wikis created"
  puts "#{users.count} users created"
  puts "#{relationships.count} relationships created"


