class Vessel < ApplicationRecord
	validates :name, presence: true
	validates :company_id, presence: true
	validates :naccs_code, presence: true, uniqueness: true
end
