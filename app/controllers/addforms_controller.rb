class AddformsController < ApplicationController
  def create
    time = Time.now.to_s(:db)
    flash = { success: "It worked!", error: "It failed." }
    town_id = "(SELECT id from towns WHERE name = '#{params[:town]}')"

    if params[:commit] == "Pridaj záznam o úmrtiach" && params.values_at(:year, :age, :count, :gender, :town).all?(&:present?)
      transaction = "BEGIN; INSERT INTO deaths (year, age, count, gender, town_id, created_at, updated_at)
      VALUES(#{params[:year]}, #{params[:age]}, #{params[:count]}, '#{params[:gender]}', #{town_id}, '#{time}', '#{time}'); COMMIT;"
      exec(transaction, "Úspešne pridaný záznam o úmrtiach v meste #{params[:town]}")

    elsif params[:commit] == "Pridaj záznam o narodeniach" && params.values_at(:year, :mother_age, :count, :gender, :town).all?(&:present?)
      transaction = "BEGIN; INSERT INTO births (year, mother_age, count, gender, town_id, created_at, updated_at)
      VALUES(#{params[:year]}, #{params[:mother_age]}, #{params[:count]}, '#{params[:gender]}', #{town_id}, '#{time}', '#{time}'); COMMIT;"
      exec(transaction, "Úspešne pridaný záznam o narodeniach v meste #{params[:town]}")

    elsif params[:commit] == "Pridaj záznam o rozvodoch" && params.values_at(:year, :women_age, :man_age, :count, :duration, :gender_petition, :verdict, :town).all?(&:present?)


    elsif params[:commit] == "Pridaj záznam o migráciách" && params.values_at(:year, :bride_age, :fiance_age, :count, :number, :town).all?(&:present?)


    elsif params[:commit] == "Pridaj záznam o sobášoch" && params.values_at(:year, :age, :emigrants, :imigrants, :gender, :reason, :town).all?(&:present?)

    else
      redirect_to addforms_path, flash: { notice: "Neboli vyplnené všetky polia! Záznam nebol pridaný!"}
    end


  end

  def index

  end

  def exec(sql, message)
    redirect_to addforms_path, flash: { notice: message}
    ActiveRecord::Base.connection.execute(sql)
  end
end
