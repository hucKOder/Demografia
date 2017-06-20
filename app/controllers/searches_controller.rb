require 'nokogiri'
require 'open-uri'
class SearchesController < ApplicationController
	def index
		@town = Town.find_by(name: params[:reason])
		if @town.nil?
			redirect_to :controller => 'towns' and return
		end

    @dic = @town.info
		@picture = @town.picture

		@id = @town.id
		@bd_diff = Birth.find_by_sql("

select year, res.s - d + plus - min result from
(select births.year, (sum(boys) + sum(girls)) s, x.d, y.plus, y.min
 from births
	join (select year, (sum(male) + sum(female)) d
		from deaths where town_id = #{@id}
		group by year) x
	on x.year = births.year

join (select year, sum(male_imigrants) + sum(female_imigrants) plus, sum(male_emigrants) + sum(female_emigrants) min
	from migrations where town_id = #{@id}
	group by year) y
	on y.year = births.year

	where town_id = #{@id}
	group by births.year, x.d,  y.plus, y.min
	order by births.year) res")

		@bd_diff = @bd_diff.map{ |i| [i.year, (i.result.to_f/@town.citizens.to_f * 100).round(3)]}


		@avg = Birth.find_by_sql("select births.year, (sum(boys) + sum(girls)) - d.sum + m.sum sum
from births

join (select year, sum(male) + sum(female) sum
	from deaths
	group by year) d on d.year = births.year

join (select year, sum(male_imigrants) + sum(female_imigrants) - sum(male_emigrants) - sum(female_emigrants) sum
	from migrations
	group by year) m on m.year = births.year

group by births.year, d.sum, m.sum
order by year")


		@population = Town.average(:citizens)
		@avg = @avg.map { |m| [m.year, m.sum.to_f/(138*@town.citizens).to_f*100] }

		@bd_diff = @bd_diff.map.with_index { |m,i| [m.first, m.second, @avg[i].second]}
		@bd_diff.insert(0,["Rok", "Nárast obyvateľstva v %", "Priemer Slovenska zhľadom na počet obyvateľov mesta"])

			@rank = Birth.find_by_sql("select rank() OVER (order by (sum(boys) + sum(girls) - d.sum + m.sum)/t.citizens::float *100 DESC), births.town_id, t.name,
																 (sum(boys) + sum(girls) - d.sum + m.sum)/t.citizens::float * 100 sum, t.citizens
			from births

			join (select sum(male) + sum(female) sum, town_id
			from deaths
			where year = 2015
			group by town_id) d on d.town_id = births.town_id

			join (select sum(male_imigrants) + sum(female_imigrants) - sum(male_emigrants) - sum(female_emigrants) sum, town_id
			from migrations
			where year = 2015
			group by town_id) m on m.town_id= births.town_id
			join (select id, citizens, name from towns) t on t.id = births.town_id
			where births.year = 2015
			group by d.sum, m.sum, births.town_id, t.citizens, t.name")

		@rank = @rank.map { |i| [i.town_id,[i.rank, i.name, i.sum, i.citizens]] }.to_h

		id = @town.info["Súradnice"].split('/').last.gsub(/ /,"").split(';')
		@hash = Gmaps4rails.build_markers(id) do |i, marker|
			marker.lat id.first
			marker.lng id.second
		end
	end

end
