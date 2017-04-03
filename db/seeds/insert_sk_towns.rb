require 'csv'

CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/mesta.csv') do |row|
	canton_id = 0
	canton = row[1]

	Canton.all.each do |cant|
		if cant.name == canton then
			canton_id = cant.id
			break
		end
	end

	Town.create({name: row[0], citizens: row[2], canton_id: canton_id})
end
