require 'csv'

place = '2010'

6.times do
  CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/umrtia/umrtia_'+place+'.csv') do |row|
    town = row[0]
    town_id = 0

    Town.all.each do |t|
      if t.name == town then
        town_id = t.id
        break
      end
    end
   Death.create({male: row[1], female: row[2], year: row[3], town_id: town_id})
  end

  place = (place.to_i + 1).to_s
end