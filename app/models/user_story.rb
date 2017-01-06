class UserStory < ApplicationRecord
	belongs_to :projekt
	belongs_to :sprint
end
