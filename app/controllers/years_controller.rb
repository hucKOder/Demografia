class YearsController < ApplicationController
	def index
		@rank = Birth.find_by_sql("select rank() OVER (order by (sum(boys) + sum(girls) - d.sum + m.sum)/t.citizens::float *100 DESC), births.town_id, t.name,
																 (sum(boys) + sum(girls) - d.sum + m.sum)/t.citizens::float * 100 sum, t.citizens
			from births

			join (select sum(male) + sum(female) sum, town_id
			from deaths
			where year = #{params["Rok"]["year"]}
			group by town_id) d on d.town_id = births.town_id

			join (select sum(male_imigrants) + sum(female_imigrants) - sum(male_emigrants) - sum(female_emigrants) sum, town_id
			from migrations
			where year = #{params["Rok"]["year"]}
			group by town_id) m on m.town_id= births.town_id
			join (select id, citizens, name from towns) t on t.id = births.town_id
			where births.year = #{params["Rok"]["year"]}
			group by d.sum, m.sum, births.town_id, t.citizens, t.name")

		@rank = @rank.map { |i| [i.town_id,[i.rank, i.name, i.sum, i.citizens]] }.to_h

		@births = Birth.find_by_sql("Select rank() over (order by (sum(boys) + sum(girls))/citizens::float*100 DESC), citizens,
  (sum(boys) + sum(girls))/citizens::float*100 sum, town_id, name
  from births
  join towns on town_id = towns.id
  where year = #{params["Rok"]["year"]}
  group by town_id, towns.name ,towns.citizens")

		@year = params["Rok"]["year"]
    @deaths = Death.find_by_sql("Select rank() over (order by (sum(male) + sum(female))/citizens::float*100 DESC),
(sum(female) + sum(male))/citizens::float*100 sum, town_id, name, citizens
from deaths
join towns on town_id = towns.id
where year = #{params["Rok"]["year"]}
group by town_id, towns.name ,towns.citizens")

	end
end

