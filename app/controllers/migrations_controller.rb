class MigrationsController < ApplicationController
	def index

		@migrations = Migration.find_by_sql("SELECT * FROM #{params[:type]} WHERE town_id = #{params[:id]}")
		@type = params[:type]

    info = "SELECT year, sum(count) x FROM deaths
    WHERE town_id = #{params[:id]}
    GROUP BY year
    ORDER BY year ASC"
	end
end
