# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
County.destroy_all

50.times {
 name = Faker::Address.unique.state
 County.create(name: name)
}

counties = County.order(:created_at)

$i = 0
while ($i < 220) do  
	name = Faker::Address.unique.country
	$x = rand(1..49)
	counties[$x].cantons.create(name: name)

	x = counties[$x].cantons.first
	100.times {
		name = Faker::Address.unique.city
		x.towns.create(name: name, citizens: rand(10000..800000))
	}
	$i +=1
end



$i = 0
while ($i < 1000) do
cities = Town.order(:created_at)
okres = Canton.order(:created_at)  
	name = okres[$i].name + "#{$i}"
	$x = rand(1..49)
	counties[$x].cantons.create(name: name)

	x = counties[$x].cantons.first
	100.times {
		$p = 0
		name = cities[$i].name + "#{$p}"
		x.towns.create(name: name, citizens: rand(10000..800000))
		$p += 1
	}
	$i +=1
end


