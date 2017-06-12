class DivorcesController < ApplicationController
  def index
    @town = params[:town]
    id = params[:divorces]

    @divorces = Divorce.where(town_id: id)
  end
end
