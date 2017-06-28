class TownsController < ApplicationController
	def index
		@towns, @alphaParams = Town.all.alpha_paginate(params[:letter], :bootstrap3 => true){|town| town.name}
	end
end
