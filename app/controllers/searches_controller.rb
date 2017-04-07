class SearchesController < ApplicationController
	def index
		@counties = County.all
	end
end
