class EditsController < ApplicationController
  def index
    @x = params[:type]
    @id = params[:id]
    @town = params[:town]
    @info = get_type(params)
  end

  def new
    #deleting record with transaction

    sql = "BEGIN; DELETE FROM #{params[:type]} WHERE id = '#{params[:id]}'; COMMIT;"
    ActiveRecord::Base.connection.execute(sql)
  end

  def edit
    #updating record with transaction
    unless params[:town_id] == ""
      @town = Town.find_by(name: "#{params[:town_id]}")

    unless @town.present?
      redirect_to edits_path(:id => params[:id], :type => params[:type], :town => params[:town]), flash: { notice: "Neplatné mesto!"}
      return
    else
      params[:town_id] = @town.id
    end
    end

    case params[:type]
      when "deaths"
        record = Death.find(params[:id])
      when "births"
        record = Birth.find(params[:id])
      when "mariages"
        record = Mariage.find(params[:id])
      when "divorces"
        record = Divorce.find(params[:id])
      when "migrations"
        record = Migration.find(params[:id])
    end


    get_set(record, params)

    if record.errors.any?
      redirect_to edits_path(:id => params[:id], :type => params[:type], :town => params[:town]), flash: { notice: record.errors.first.second}
    else
      @message = record
      @town = params[:town]
    end

    #sql = "BEGIN; UPDATE #{params[:type]}
     #      SET
              #{get_set(params)}
      #     WHERE
       #       id = #{params[:id]};
        #   COMMIT;"

    #ActiveRecord::Base.connection.execute(sql)
  end

  def get_type(params)
    case params[:type]
      when "deaths"
        record = Death.find(params[:id])
      when "births"
        record = Birth.find(params[:id])
      when "mariages"
        record = Mariage.find(params[:id])
      when "divorces"
        record = Divorce.find(params[:id])
      when "migrations"
        record = Migration.find(params[:id])
    end
  end
  #town cannot be updated
  def get_set(record, params)
    #sql = ""

    params.stringify_keys.each do |key, value|
      if ActiveRecord::Base.connection.column_exists?(params[:type].parameterize.underscore.to_sym, key.parameterize.underscore.to_sym)
        if value.present? then
          if key == "gender" || key == "reason" || key == "verdict" || key == "gender_file_a_petition" ||
              key == "mariage_count" then
            record.update(key.parameterize.underscore.to_sym => "#{value}")
          else
            record.update(key.parameterize.underscore.to_sym => value)
          end
        end
      end
    end


    #params.stringify_keys.each do |key, value|
      #if ActiveRecord::Base.connection.column_exists?(params[:type].parameterize.underscore.to_sym, key.parameterize.underscore.to_sym)
       # if value.present? then
        #  if key == "gender" then
          #  sql += "#{key} = '#{value}', "
          #else
          #  sql += "#{key} = #{value}, "
        #  end
        #end
     # end
    #end

    #sql[0..-3]
  end
end
