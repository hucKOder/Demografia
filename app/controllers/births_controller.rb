class BirthsController < ApplicationController
  def index
    @town = params[:town]
    id = params[:births]

    @births = Birth.where(town_id: id)

    @arr = []
    @arr = @births.map{ |i| [i.year, i.boys, i.girls]}
    @arr = @arr.sort {|a,b| a[0] <=> b[0]}
    @arr.insert(0,["Rok", "Počet narodených chlapcov", "Počet narodených dievčat"])

    @in_marriage = @births.map{ |i| [i.year, i.boys + i.girls, i.in_marriage]}
    @in_marriage = @in_marriage.sort {|a,b| a[0] <=> b[0]}
    @in_marriage.insert(0,["Rok", "Počet narodených", "Počet narodených v manželstve"])
  end
end
