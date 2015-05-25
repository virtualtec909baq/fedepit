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

if Color.all.empty?
	30.times do
		Color.create(name: Faker::Commerce.color)
	end
end

