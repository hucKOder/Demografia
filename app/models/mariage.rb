class Mariage < ApplicationRecord
	belongs_to :town

	validates :year, :numericality => { :only_integer => true, message: "Rok môže byť iba celé číslo"}
	validates :bride_age, :numericality => { :only_integer => true, message: "Vek nevesty môže byť iba celé číslo"}
  validates :fiance_age, :numericality => { :only_integer => true, message: "Vek ženícha môže byť iba celé číslo"}
  validates :mariage_count, :acceptance => { :accept => ['Prvy v poradi', 'Vyssieho poradia'], message: "Manželstvo v poradí môže byť iba Prvy v poradi alebo Vyssieho poradia"}
  validates :count, :numericality => { :only_integer => true, message: "Počet môže byť iba celé číslo"}
	validates :town_id, presence: true

	validates_uniqueness_of :year, { :scope => [:town_id, :bride_age, :fiance_age, :mariage_count],
                                   message: "Záznam v tomto roku s daným vekom nevesty a ženícha pre dané mesto už existuje!" }
end
