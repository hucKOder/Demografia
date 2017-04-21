class AddformsController < ApplicationController
  def create
    town = params[:town]
    sql = "SELECT id from towns WHERE name = #{town}"
    x = Town.find_by_sql(sql)
    Death.create(params, x.id)
  end
  def index
  end
end
