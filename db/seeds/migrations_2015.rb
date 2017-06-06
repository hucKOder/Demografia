require 'csv'

CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/2015/migracia.csv') do |row|
  town = row[0]
  town_id = 0

  Town.all.each do |t|
    if t.name == town then
      town_id = t.id
      break
    end
  end
  Migration.create({male_imigrants: row[1],
  female_imigrants: row[2],
  sr_imigrants: row[3],
  foreign_imigrants: row[4],
  male_emigrants: row[5],
  female_emigrants: row[6],
  sr_emigrants: row[7],
  foreign_emigrants: row[8],
                   year:  row[9],
                   town_id: town_id})
end
