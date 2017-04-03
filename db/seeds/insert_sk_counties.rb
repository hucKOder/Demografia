require 'csv'

CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/kraje.csv') do |row|
	County.create({name: row[0]})
end