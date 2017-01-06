class Projekt < ApplicationRecord

	belongs_to :user
	has_many :user_stories
	has_many :sprints
end
