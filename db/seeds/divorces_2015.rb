require 'csv'

CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/2015/rozvody.csv') do |row|
  town = row[0]
  town_id = 0

  Town.all.each do |t|
    if t.name == town then
      town_id = t.id
      break
    end
  end
  Divorce.create({number: row[1], male_petition: row[2], female_petition: row[3],
                  divorces_number: row[4], male_average_age: row[5], female_average_age: row[6],
                  average_duration: row[7], year: row[8], town_id: town_id})
end
