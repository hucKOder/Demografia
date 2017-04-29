class MigrationsController < ApplicationController
	def index

		@migrations = Migration.find_by_sql("SELECT * FROM #{params[:type]} WHERE town_id = #{params[:id]}")
		@type = params[:type]

    info = "SELECT year y, sum(count) x FROM #{params[:type]}
    WHERE town_id = #{params[:id]}
    GROUP BY year
    ORDER BY year ASC"
    infoMigration = "SELECT year y, sum(emigrants) x, sum(imigrants) i FROM #{params[:type]}
              WHERE town_id = #{params[:id]}
              GROUP BY year
              ORDER BY year ASC"
    @information = get_type(params, info, infoMigration)

	end

	def get_type(params, info, infoMigration)
		record = ""
    case params[:type]
			when "deaths"
				record = Death.find_by_sql(info)
			when "births"
				record = Birth.find_by_sql(info)
			when "mariages"
				record = Mariage.find_by_sql(info)
			when "divorces"
				record = Divorce.find_by_sql(info)
			when "migrations"
				record = Migration.find_by_sql(infoMigration)
		end
	end
end
