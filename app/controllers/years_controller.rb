class YearsController < ApplicationController
	def index
		@year = params[:date][:year]
	end
end
