class Birth < ApplicationRecord
	belongs_to :town

  validates :year, :numericality => { :only_integer => true, message: "Rok môže byť iba celé číslo"}
  validates :mother_age, :numericality => { :only_integer => true, message: "Vek môže byť iba celé číslo"}
  validates :count, :numericality => { :only_integer => true, message: "Počet môže byť iba celé číslo"}
  validates :gender, :acceptance => { :accept => ['Female', 'Male'], message: "Pohlavie môže byť iba Male alebo Female" }
  validates :town_id, presence: true

  validates_uniqueness_of :year, { :scope => [:town_id, :mother_age, :gender], message: "Záznam v tomto roku s daným vekom matky, pohlavím dieťaťa pre dané mesto už existuje!" }
end
