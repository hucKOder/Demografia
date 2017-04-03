$i = 0
puts 'divorces'
towns = Town.order(:created_at)
while ($i < 1000000)
	year = rand(1996..2016)
	women_age = rand(30..48)
	man_age = rand(30..48)
	duration = rand(14..28)
	gender = Faker::Demographic.sex
	
	verdict = ["Manzelstvo rozvedene", "Navrh zamietnuty", "Navrh vzaty spat",
	 "Ine rozhodnutie" ].sample

	if verdict == "Manzelstvo rozvedene" then
		count = rand(0..400)
	elsif verdict == "Navrh zamietnuty" then
		count = rand(0..2)
	elsif verdict == "Navrh vzaty spat" then
		count = rand(0..20)
	else count = rand(0..4)
	end	

	id = towns[rand(0..121999)].id

	Divorce.create(year: year, women_age: women_age, man_age: man_age, count: count,
	 duration: duration, gender_file_a_petition: gender, verdict: verdict, town_id: id)
	$i += 1
end