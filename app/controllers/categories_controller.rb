class CategoriesController < ApplicationController
	def index
		@id = Town.find_by_sql("SELECT * FROM towns WHERE id = #{params[:town_id]}")
		@type = params[:type]
	end
end
