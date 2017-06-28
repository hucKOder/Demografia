require 'csv'

#CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/towns.csv') do |row|
#  Town.create(name: row[0])
#end


place = '2005'

5.times do
  CSV.foreach('/home/yourtruefrend/Desktop/DB-obce/narodenia/narodeni_'+place+'.csv') do |row|
   town = row[0]
   town_id = 0

   Town.all.each do |t|
     if t.name == town then
       town_id = t.id
       break
     end
   end
   Birth.create({boys: row[1], girls: row[2], in_marriage: row[3], year: row[4], town_id: town_id})
  end

  place = (place.to_i + 1).to_s
end
