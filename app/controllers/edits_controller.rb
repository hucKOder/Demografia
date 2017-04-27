class EditsController < ApplicationController
  def index
    @x = params[:type]
    @id = params[:id]
  end

  def new
    sql = "BEGIN; DELETE FROM #{params[:type]} WHERE id = '#{params[:id]}'; COMMIT;"
    ActiveRecord::Base.connection.execute(sql)
  end

  def edit
    sql = "BEGIN; UPDATE #{params[:type]}
           SET
              #{get_set(params)}
           WHERE
              id = #{params[:id]};
           COMMIT;"

    ActiveRecord::Base.connection.execute(sql)
  end

  #town cannot be updated
  def get_set(params)
    sql = ""
    params.stringify_keys.each do |key, value|
      if ActiveRecord::Base.connection.column_exists?(params[:type].parameterize.underscore.to_sym, key.parameterize.underscore.to_sym)
        if value.present? then
          if key == "gender" then
            sql += "#{key} = '#{value}', "
          else
            sql += "#{key} = #{value}, "
          end
        end
      end
    end

    sql[0..-3]
  end
end
