class Town < ApplicationRecord
	#has_many :deaths, :births, :divorces, :mariages, :migrations
  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end
end
