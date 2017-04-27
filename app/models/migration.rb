class Migration < ApplicationRecord
	belongs_to :town

  validates :year, :numericality => { :only_integer => true, message: "Rok môže byť iba celé číslo"}
  validates :age, :numericality => { :only_integer => true, message: "Vek môže byť iba celé číslo"}
  validates :emigrants, :numericality => { :only_integer => true, message: "Počet odsťahovalcov môže byť iba celé číslo"}
  validates :imigrants, :numericality => { :only_integer => true, message: "Počet prisťahovalcov môže byť iba celé číslo"}
  validates :reason, :acceptance => { :accept => ["Zmena pracoviska", "Sobas", "Studium", "Rozvod", "Nasledovanie rodinneho prislusnika",
                                                  "Bytove dovody", "Ine dovody"], message: "Nesprávny formát dôvodu!"}
  validates :gender, :acceptance => { :accept => ['Female', 'Male'], message: "Pohlavie môže byť iba Male alebo Female" }
  validates :town_id, presence: true

  validates_uniqueness_of :year, { :scope => [:town_id, :emigrants, :imigrants, :age, :gender, :reason],
                                   message: "Záznam v tomto roku so zadaným počtom emigrantov, v zadanom veku a so zadaným dôvodom pre dané mesto už existuje!" }
end
