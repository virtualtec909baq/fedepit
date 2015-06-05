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

if Race.all.empty?
	10.times  do 
		Race.create(name: Faker::Name.name, description: Faker::Lorem.paragraph(3))
	end
end

if TypeEvent.all.empty?
	30.times do
		TypeEvent.create(name: Faker::Name.title)
	end
end

10.times do
	Canine.create(race_id: rand(1..29), breeder_id: rand(1..2), name: Faker::Name.name, lof: Faker::Internet.url, chip: Faker::Internet.url, color_id: rand(1..19), ancestry: 13 )
end


if Sponsor.all.empty?
	10.times do
		Sponsor.create(name: Faker::Name.title, url: Faker::Internet.url, image: Faker::Avatar.image)
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

if Color.all.empty?
	30.times do
		Color.create(name: Faker::Commerce.color)
	end
end

