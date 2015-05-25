if Article.all.empty?
	30.times do
		Article.create(title: Faker::Name.title , description: Faker::Lorem.paragraph(2))
	end
end

if TypeEvent.all.empty?
	30.times do
		TypeEvent.create(name: Faker::Name.title)
	end
end
