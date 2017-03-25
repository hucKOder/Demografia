class Town < ApplicationRecord
	#has_many :deaths, :births, :divorces, :mariages, :migrations
	belongs_to :canton
end
