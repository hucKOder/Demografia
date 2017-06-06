# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/kraje.csv') do |row|
	County.create(name: row[0])
end

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
