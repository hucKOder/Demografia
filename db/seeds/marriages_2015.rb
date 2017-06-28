require 'csv'

place = '2005'

5.times do
CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/sobase/sobase_'+place+'.csv') do |row|
  town = row[0]
  town_id = 0

  Town.all.each do |t|
    if t.name == town then
      town_id = t.id
      break
    end
  end
  Marriage.create({male_home_number: row[1],
                   male_home_first_number: row[2],
                   male_home_avg_age: row[3],
                   female_home_number: row[4],
                   female_home_first_number: row[5],
                   female_home_avg_age: row[6],
                   year:  row[7],
                   town_id: town_id})
end
  place = (place.to_i + 1).to_s
end