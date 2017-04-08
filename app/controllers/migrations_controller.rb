class MigrationsController < ApplicationController
	def index
		@migrations = Migration.find_by_sql("SELECT * FROM #{params[:type]} WHERE town_id = #{params[:id]}")
		@type = params[:type]
	end
end
