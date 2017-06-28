class DeathsController < ApplicationController
  def index
    @town = params[:town]
    id = params[:deaths]

    @deaths = Death.where(town_id: id)

    @arr = []
    @arr = @deaths.map{ |i| [i.year, i.male, i.female]}
    @arr = @arr.sort {|a,b| a[0] <=> b[0]}
    @arr.insert(0,["Rok", "Počet zomretých mužov", "Počet zomretých žien"])

    @sum = @arr.map{ |i| [i.first, i.second + i.third] }
    @sum[0] = ["Rok", "Počet zomretých"]

  end
end
