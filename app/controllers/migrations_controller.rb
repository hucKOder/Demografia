class MigrationsController < ApplicationController
	def index
		@town = params[:town]
		id = params[:migrations]

		@migrations = Migration.where(town_id: id)

		@male= []
		@male = @migrations.map{ |i| [i.year, i.male_imigrants, i.male_emigrants]}
		@male = @male.sort {|a,b| a[0] <=> b[0]}
		@male.insert(0,["Rok", "Počet prisťahovaných mužov", "Počet vysťahovaných mužov"])

		@female = []
		@female = @migrations.map{ |i| [i.year, i.female_imigrants, i.female_emigrants]}
		@female = @female.sort {|a,b| a[0] <=> b[0]}
		@female.insert(0,["Rok", "Počet prisťahovaných žien", "Počet vysťahovaných žien"])

		@sr = []
		@sr = @migrations.map{ |i| [i.year, i.sr_imigrants, i.sr_emigrants]}
		@sr = @sr.sort {|a,b| a[0] <=> b[0]}
		@sr.insert(0,["Rok", "Počet prisťahovaných zo Slovneska", "Počet vysťahovaných na Slovensko"])

		@fgn = []
		@fgn = @migrations.map{ |i| [i.year, i.foreign_imigrants, i.foreign_emigrants]}
		@fgn = @fgn.sort {|a,b| a[0] <=> b[0]}
		@fgn.insert(0,["Rok", "Počet prisťahovaných zo zahraničia", "Počet vysťahovaných do zahraničia"])
	end
end
