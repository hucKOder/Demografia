class Divorce < ApplicationRecord
	belongs_to :town

	validates :year, :numericality => { :only_integer => true, message: "Rok môže byť iba celé číslo"}
	validates :women_age, :numericality => { :only_integer => true, message: "Vek ženy môže byť iba celé číslo"}
	validates :man_age, :numericality => { :only_integer => true, message: "Vek muža môže byť iba celé číslo"}
  validates :verdict, :acceptance => { :accept => ["Manzelstvo rozvedene", "Navrh zamietnuty", "Navrh vzaty spat",
                                                   "Ine rozhodnutie" ], message: "Nesprávny formát verdiktu!"}
  validates :count, :numericality => { :only_integer => true, message: "Počet môže byť iba celé číslo"}
  validates :duration, :numericality => { :only_integer => true, message: "Trvanie môže byť iba celé číslo"}
  validates :town_id, presence: true
  validates :gender_file_a_petition, :acceptance => { :accept => ['Female', 'Male'], message: "Pohlavie, ktoré podalo návrh môže byť iba Male alebo Female" }

  validates_uniqueness_of :year, { :scope => [:town_id, :women_age, :man_age, :verdict, :gender_file_a_petition, :duration],
																	 message: "Záznam v tomto roku s daným vekom muža, ženy atď; pre dané mesto už existuje!" }
end
