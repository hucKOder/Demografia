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

		@bd_diff = @bd_diff.map{ |i| [i.year, i.result]}
		@bd_diff.insert(0,["Rok", "Nárast obyvateľstva"])

		@md_diff
	end

end
