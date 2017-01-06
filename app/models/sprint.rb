class Sprint < ApplicationRecord
	has_many :user_stories
	belongs_to :projekt
end
