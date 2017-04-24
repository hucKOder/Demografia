class EditsController < ApplicationController
  def index
    @x = params[:type]
    @id = params[:id]
  end

  def new
    sql = "BEGIN; DELETE FROM #{params[:type]} WHERE id = '#{params[:id]}'; COMMIT;"
    ActiveRecord::Base.connection.execute(sql)
  end

end
