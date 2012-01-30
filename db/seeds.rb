require 'faker'

# 10000.times do |i|
# 	User.create!(:name => Faker::Name.name, :provider => 'identity', :uid => i)
# end

User.all.each do |user|
	Recipe.create!(user: user, name: Faker::Lorem.sentence(sentence_count = 1), instructions: Faker::Lorem.paragraph(paragraph_count = 3), preperation_time: 30)
end