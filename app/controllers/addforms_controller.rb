class AddformsController < ApplicationController
  def create
    #town_id = "(SELECT id from towns WHERE name = '#{params[:town]}')"

    #ActiveRecord vytvara automaticky transakcie pre save a destroy
    town = Town.where(name: "#{params[:town]}")
    unless town.present?
      redirect_to addforms_path, flash: { notice: "Neplatné mesto!"}
      return
    end

    if params[:commit] == "Pridaj záznam o úmrtiach" && params[:town].present?
      x = Death.new(year: params[:year], age: params[:age], count: params[:count], gender: "#{params[:gender]}", town_id: town.first.id)
      make_record(x)

      #transaction = "BEGIN; INSERT INTO deaths (year, age, count, gender, town_id, created_at, updated_at)
      #VALUES(#{params[:year]}, #{params[:age]}, #{params[:count]}, '#{params[:gender]}', #{town_id}, '#{time}', '#{time}'); COMMIT;"

    elsif params[:commit] == "Pridaj záznam o narodeniach" && params[:town].present?
      x = Birth.new(year: params[:year], mother_age: params[:mother_age], count: params[:count], gender: "#{params[:gender]}", town_id: town.first.id)
      make_record(x)

      #transaction = "BEGIN; INSERT INTO births (year, mother_age, count, gender, town_id, created_at, updated_at)
      #VALUES(#{params[:year]}, #{params[:mother_age]}, #{params[:count]}, '#{params[:gender]}', #{town_id}, '#{time}', '#{time}'); COMMIT;"

    elsif params[:commit] == "Pridaj záznam o rozvodoch" && params[:town].present?
      x = Divorce.new(year: params[:year], women_age: params[:women_age], man_age: params[:man_age], count: params[:count], duration: params[:duration], gender_file_a_petition: "#{params[:gender_petition]}", verdict: "#{params[:verdict]}", town_id: town.first.id)
      make_record(x)

      #transaction = "BEGIN; INSERT INTO divorces (year, women_age, man_age, count, duration, gender_file_a_petition, verdict, created_at, updated_at, town_id)
      #VALUES(#{params[:year]}, #{params[:women_age]}, #{params[:man_age]}, #{params[:count]}, #{params[:duration]}, '#{params[:gender_petition]}', '#{params[:verdict]}', '#{time}', '#{time}', #{town_id}); COMMIT;"

    elsif params[:commit] == "Pridaj záznam o migráciách" && params[:town].present?
      x = Migration.new(year: params[:year], age: params[:age], emigrants: params[:emigrants], imigrants: params[:imigrants], gender: "#{params[:gender]}", reason: "#{params[:reason]}", town_id: town.first.id)
      make_record(x)

      #transaction = "BEGIN; INSERT INTO migrations (year, age, emigrants, imigrants, gender, reason, town_id, updated_at, created_at)
      #VALUES(#{params[:year]}, #{params[:age]}, #{params[:emigrants]}, #{params[:imigrants]}, '#{params[:gender]}', '#{params[:reason]}', #{town_id}, '#{time}', '#{time}'); COMMIT;"

    elsif params[:commit] == "Pridaj záznam o sobášoch" && params[:town].present?
      x = Mariage.new(year: params[:year], bride_age: params[:bride_age], fiance_age: params[:fiance_age], count: params[:count], mariage_count: "#{params[:number]}", town_id: town.first.id)
      make_record(x)

      #transaction = "BEGIN; INSERT INTO mariages (year, bride_age, fiance_age, count, mariage_count, town_id, updated_at, created_at)
      #VALUES(#{params[:year]}, #{params[:bride_age]}, #{params[:fiance_age]}, #{params[:count]}, '#{params[:number]}', #{town_id}, '#{time}', '#{time}'); COMMIT;"
    else
      redirect_to addforms_path, flash: { notice: "Neboli vyplnené správne všetky polia! Záznam nebol pridaný!"}

    end

  end

  def index

  end

  def make_record(x)

    if !x.save
      if x.errors.any?
        redirect_to addforms_path, flash: { notice: x.errors.first.second}
      end
    else
      redirect_to addforms_path, flash: { notice: "Úspešne pridaný záznam pre mesto #{params[:town]}"}
    end

  end
end
