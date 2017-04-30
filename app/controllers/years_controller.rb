class YearsController < ApplicationController
	def index
		sql_death = "SELECT deaths.id, age, count ,gender, t.name z, year FROM deaths
		JOIN towns t ON t.id = town_id"

		sql_birth = "SELECT births.id, year, mother_age, count, gender, t.name z FROM births
		JOIN towns t ON t.id = town_id"

		sql_marriage = "SELECT mariages.id, year, bride_age, fiance_age, count, mariage_count, t.name z
		FROM mariages JOIN towns t ON t.id = town_id"

		sql_divorce = "SELECT divorces.id, year, women_age, man_age, count, duration, gender_file_a_petition,
		verdict, t.name z FROM divorces	JOIN towns t ON t.id = town_id"

		sql_migration = "SELECT migrations.id, year, age, emigrants, imigrants, gender, t.name z, reason FROM migrations
		JOIN towns t ON t.id = town_id"

		info = ""
		par = ""
		@deaths = 0
		@type = 0

		if params.has_key?(:year) && (valid(params[:year]) || valid(params[:town]) || valid(params[:gender]) || valid(params[:demograf])) then
			table = ""
			case params[:demograf]
			when "umrtnost"
				@deaths = Death.find_by_sql(filter(sql_death))
				@type = :death
          table = "deaths"
			when "porodnost"
				@deaths = Birth.find_by_sql(filter(sql_birth))
				@type = :birth
          table = "births"
				when "sobase"
					if valid(params[:gender])
						@deaths = Mariage.find_by_sql(sql_marriage+" LIMIT 2000")
					else
						@deaths = Mariage.find_by_sql(filter(sql_marriage))
					end
				@type = :marriage
          table = "mariages"
				when "rozvody"
					if valid(params[:gender])
						@deaths = Divorce.find_by_sql(sql_divorce+" LIMIT 2000")
					else
						@deaths = Divorce.find_by_sql(filter(sql_divorce))
					end
				@type = :divorce
          table = "divorces"
			when "migracia"
				@deaths = Migration.find_by_sql(filter(sql_migration))
				@type = :migration
          table = "migrations"
			end

		else
			@deaths = Death.find_by_sql("#{sql_death} LIMIT 2000")
			@type = :death
      table = "deaths"
    end

		info = "SELECT sum(#{table}.count) x, year y FROM #{table}
							GROUP BY year
							ORDER BY year ASC"
    case @type
      when :death
        @years = Death.find_by_sql(info)
      when :birth
        @years = Birth.find_by_sql(info)
      when :divorce
        @years = Divorce.find_by_sql(info)
      when :marriage
        @years = Mariage.find_by_sql(info)
      when :migration
       info = "SELECT sum(emigrants) x, sum(imigrants) i, year y FROM migrations
        GROUP BY year
        ORDER BY year ASC"
        @years = Migration.find_by_sql(info)
    end

		
	end

	private
	def valid(x)
		if x == "" 
			false
		else true
		end
	end

	def filter(sql)
		par = "LIMIT 2000"
		if valid(params[:year]) and valid(params[:town]) and valid(params[:gender]) then
			par = "WHERE t.name = '#{params[:town]}' AND year = #{params[:year]} AND gender = '#{params[:gender]}'"

		elsif valid(params[:gender]) and valid(params[:town])
			par = "WHERE gender = '#{params[:gender]}' AND t.name = '#{params[:town]}'"

		elsif valid(params[:gender]) and valid(params[:year])
			par = "WHERE gender = '#{params[:gender]}' AND year = #{params[:year]}"

		elsif valid(params[:year]) and valid(params[:town])
			par = "WHERE year = '#{params[:year]}' AND t.name = '#{params[:town]}'"

		elsif valid(params[:gender])
			par = "WHERE gender = '#{params[:gender]}'"
		elsif valid(params[:year]) then
			par = "WHERE year = #{params[:year]}"
		elsif valid(params[:town])
			par = "WHERE t.name = '#{params[:town]}'"
		end

		"#{sql} #{par}"

	end
end

