class TownsController < ApplicationController
	def index
		@towns = Town.find_by_sql("SELECT * FROM towns WHERE canton_id = #{params[:canton_id]}")
	end
end
