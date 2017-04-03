require 'csv'

CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/okresy.csv') do |row|
	county = row[1]
	county_id = 0
	County.all.each do |count|
		if count.name == county then
			county_id = count.id
			break
		end
	end
	Canton.create({name: row[0], county_id: county_id})
end