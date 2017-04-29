class Death < ApplicationRecord
	belongs_to :town

	validates :year, :numericality => { :only_integer => true, message: "Rok môže byť iba celé číslo"}
  validates :age, :numericality => { :only_integer => true, message: "Vek môže byť iba celé číslo"}
  validates :count, :numericality => { :only_integer => true, message: "Počet môže byť iba celé číslo"}
  validates :gender, :acceptance => { :accept => ['Female', 'Male'], message: "Pohlavie môže byť iba Male alebo Female" }
  validates :town_id, presence: true

  validates_uniqueness_of :year, { :scope => [:town_id, :age, :gender], message: "Záznam o tomto roku, veku a pohlaví už existuje!" }
end
