if Article.all.empty?
	30.times do
		Article.create(title: Faker::Name.title , description: Faker::Lorem.paragraph(2))
	end
end

if Video.all.empty?
	30.times do
		Video.create(title: Faker::Name.title,description: Faker::Lorem.paragraph(2), url: "uK324BQMbV8")
	end
end

if TypeEvent.all.empty?
	30.times do
		TypeEvent.create(name: Faker::Name.title)
	end
end

if TypeBreeder.all.empty?
	30.times do
		TypeBreeder.create(name: Faker::Name.title)
	end
end

if Breeder.all.empty?
	30.times do
		Breeder.create(name: Faker::Name.name, type_breeder_id: rand(1..29), phone: Faker::Number.number(10), email: Faker::Internet.email, name_breed: Faker::Company.name, facebook: Faker::Internet.url, twitter: Faker::Internet.url, instagram: Faker::Internet.url, web: Faker::Internet.url)
	end
end