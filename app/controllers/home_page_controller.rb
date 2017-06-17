class HomePageController < ApplicationController
  def index
  	@divorces = Divorce.find_by_sql("SELECT year, sum(divorces_number) d FROM divorces GROUP BY year")
    @marriages = Marriage.find_by_sql("Select year, sum(male_home_number) m, sum(female_home_number) f
                                       FROM marriages GROUP BY year")
    @births = Birth.find_by_sql("Select year, sum(girls) g, sum(boys) b, (sum(girls) + sum(boys)) s  from births GROUP BY year
                                order by year")
    @deaths = Death.find_by_sql("select year, (sum(male) + sum(female)) sum from deaths GROUP BY year")

    respond_to do |format|
      format.html
      format.json { @towns = Town.search(params[:term]) }
    end
  end
end
