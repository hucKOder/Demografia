require 'nokogiri'
require 'open-uri'
class SearchesController < ApplicationController
	def index
		@town = Town.find_by(name: params[:reason])
		if @town.nil?
			redirect_to :controller => 'towns' and return
		end
		doc = Nokogiri::HTML(open(URI.escape('https://sk.wikipedia.org/wiki/'+params[:reason])))
		x = doc.css('.geography tr')
		@dic = {}
		x.each do |i|
			if i.css('th').text != "" then
			@dic[i.css('th').text.gsub(/\n/,' ').squish] = i.css('td').text.gsub(/\n/,' ').squish
			end
		end

		@picture = x.css('img').attr('src').value

		@id = Town.find_by(name: params[:reason]).id
		@bd_diff = Birth.find_by_sql("
			select res.y y, (b - d) sum from
	(select births.year y, (sum(boys) + sum(girls)) b, x.d from births
	join (select year, (sum(male) + sum(female)) d from deaths where town_id = #{@id} group by year) x
	on x.year = births.year
	where town_id = #{@id}
	group by births.year, x.d) res
	order by res.y")
		@bd_diff = @bd_diff.map{ |i| [i.y, i.sum]}
		@bd_diff.insert(0,["Rok", "Rozdiel medzi narodeniami a úmrtiami"])

	end

end
