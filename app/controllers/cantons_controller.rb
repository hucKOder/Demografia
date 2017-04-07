class CantonsController < ApplicationController
	def index
		@cantons = Canton.find_by_sql("SELECT * FROM cantons WHERE county_id = #{params[:county_id]}")
	end
end
