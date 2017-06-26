class HomePageController < ApplicationController
  def index
  	@divorces = Divorce.find_by_sql("SELECT year, sum(divorces_number) d FROM divorces GROUP BY year")
    @marriages = Marriage.find_by_sql("Select year, sum(male_home_number) m, sum(female_home_number) f
                                       FROM marriages GROUP BY year")
    @births = Birth.find_by_sql("Select year, sum(girls) g, sum(boys) b, (sum(girls) + sum(boys)) s  from births GROUP BY year
                                order by year")
    @deaths = Death.find_by_sql("select year, (sum(male) + sum(female)) sum from deaths GROUP BY year order by year")
    @towns = Town.all.map{ |i| i.name }

    @avg = Marriage.find_by_sql("select year, round(CAST(avg(male_home_avg_age) as numeric),2) male,
  round(CAST(avg(female_home_avg_age) as numeric) , 2) female
  from marriages
  group by year
  order by year")
    @avg = @avg.map{ |i| [i.year, i.male.to_f, i.female.to_f] }
    @avg.insert(0, ["Rok", "Priemerny vek ženícha", "Priemerny vek nevesty"])

    @migrations = Migration.find_by_sql("select year, sum(foreign_imigrants) im, sum(foreign_emigrants) em
    from migrations
    group by year
    order by year")

    @migrations = @migrations.map{ |i| [i.year, i.im, i.em] }
    @migrations.insert(0, ["Rok", "Počet prisťahovaných", "Priemerny vysťahovaných"])

    @births = @births.map.with_index { |m, i| [m.year, m.s, @deaths[i].sum ] }
    @births.insert(0, ["Rok", "Počet narodení", "Počet umrtí"])

  end
end
