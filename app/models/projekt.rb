class Projekt < ApplicationRecord

	belongs_to :user

	has_many :product_backlogs
end
