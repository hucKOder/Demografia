class MarriagesController < ApplicationController
  def index
    @town = params[:town]
    id = params[:marriages]

    @marriages = Marriage.where(town_id: id)
  end
end
