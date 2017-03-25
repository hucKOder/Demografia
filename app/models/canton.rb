class Canton < ApplicationRecord
	has_many :towns
	belongs_to :county
end
