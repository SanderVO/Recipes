# require 'faker'

# 1000.times do |i|
# 	User.create!(:name => Faker::Name.name, :provider => 'identity', :uid => i)
# end

# User.all.each do |user|
# 	Recipe.create!( user: user, name: Faker::Lorem.sentence(sentence_count = 1), instructions: Faker::Lorem.paragraph(paragraph_count = 3), description: Faker::Lorem.paragraph(paragraph_count = 1), preperation_time: 30, image: 'food.jpg')
# end