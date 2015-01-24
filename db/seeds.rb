require 'faker'

# Create standard Users
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

#5 premium users
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

#Create Public Wikis
50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
)
end

# 50 Private Wikis
50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    personal: true
  )
end
wikis = Wiki.all

# make sure each wiki has a creator
wikis.each do |w|
  Relationship.create!(
    user: users.sample,
    wiki: w,
    creator_created: true
  )
end
relationships = Relationship.all
    
  puts "Seed finished"
  puts "#{wikis.count} wikis created"
  puts "#{users.count} users created"
  puts "#{relationships.count} relationships created"


