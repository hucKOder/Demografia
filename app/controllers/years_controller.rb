class YearsController < ApplicationController
	def index
		sql_death = "SELECT age,sum(count) x,gender, t.name z, year FROM deaths
		JOIN towns t ON t.id = town_id
		GROUP BY age, gender, t.name, year
		ORDER BY age ASC"

		sql_birth = "SELECT year, mother_age age, sum(count) x, gender, t.name z FROM births
		JOIN towns t ON t.id = town_id
		GROUP BY mother_age, gender, year, t.name"

		sql_marriage = "SELECT year, bride_age, fiance_age, sum(count) x, mariage_count, t.name z
		FROM mariages 
		JOIN towns t ON t.id = town_id
		GROUP BY bride_age, fiance_age, mariage_count, year, z"

		sql_divorce = "SELECT year, women_age, man_age, sum(count) x, duration, gender_file_a_petition, verdict, t.name z 
		FROM divorces
		JOIN towns t ON t.id = town_id
		GROUP BY verdict, duration, women_age, man_age,t.name, gender_file_a_petition, year"

		sql_migration = "SELECT year, age, emigrants, imigrants, gender, t.name z, reason FROM migrations
		JOIN towns t ON t.id = town_id
		GROUP BY t.name, gender, age, year, emigrants, imigrants, reason"

		par = ""
		@deaths = 0
		@type = 0

		if params.has_key?(:year) && (valid(params[:year]) || valid(params[:town]) || valid(params[:gender]) || valid(params[:demograf])) then
			
			case params[:demograf]
			when "umrtnost"
				@deaths = Death.find_by_sql(filter(sql_death, "Úmrtnosť"))
				@type = :death
			when "porodnost"
				@deaths = Birth.find_by_sql(filter(sql_birth, "Pôrodnosť"))
				@type = :birth
			when "sobase"
				@deaths = Mariage.find_by_sql(filter(sql_marriage, "Sobáše"))
				@type = :marriage
			when "rozvody"
				@deaths = Divorce.find_by_sql(filter(sql_divorce, "Rozvody"))
				@type = :divorce	
			when "migracia"
				@deaths = Migration.find_by_sql(filter(sql_migration, "Migrácia"))
				@type = :migration
			end

		else
			@deaths = Death.find_by_sql("SELECT xx.age age, xx.x x, xx.gender gender, xx.z t, xx.year y 
				FROM (#{sql_death}) as xx LIMIT 2000")
			@type = :death
		end
		
	end

	private
	def valid(x)
		if x == "" 
			false
		else true
		end
	end

	def filter(sql, type)
		par = "LIMIT 10000"
		if valid(params[:year]) and valid(params[:town]) and valid(params[:gender]) then
			par = "WHERE xx.z = '#{params[:town]}' AND year = #{params[:year]} AND gender = '#{params[:gender]}'"

		elsif valid(params[:gender]) and valid(params[:town])
			par = "WHERE gender = '#{params[:gender]}' AND xx.z = '#{params[:town]}'"

		elsif valid(params[:gender]) and valid(params[:year])
			par = "WHERE gender = '#{params[:gender]}' AND year = #{params[:year]}"

		elsif valid(params[:year]) and valid(params[:town])
			par = "WHERE year = '#{params[:year]}' AND xx.z = '#{params[:town]}'"

		elsif valid(params[:gender])
			par = "WHERE gender = '#{params[:gender]}' LIMIT 2000"
		elsif valid(params[:year]) then
			par = "WHERE year = #{params[:year]}"
		elsif valid(params[:town])
			par = "WHERE xx.z = '#{params[:town]}'"
		end

		if type == "Sobáše"
			"SELECT xx.year y, xx.x x, xx.z t, xx.bride_age , xx.fiance_age , xx.mariage_count 
			FROM (#{sql}) as xx #{par}"

		elsif type == "Migrácia"
			"SELECT xx.year y, xx.z t, xx.age, xx.emigrants, xx.imigrants, xx.gender gender, xx.reason 
			FROM (#{sql}) as xx #{par}"

		elsif type == "Rozvody"
			"SELECT xx.year y, xx.women_age, xx.man_age, xx.x x, xx.duration, xx.gender_file_a_petition gender, xx.verdict, xx.z t
			FROM (#{sql}) as xx #{par}"
		else
			"SELECT xx.age age, xx.x x, xx.gender gender, xx.z t, xx.year y 
			FROM (#{sql}) as xx #{par}"
		end
	end
end

