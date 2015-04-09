class Organization < ActiveRecord::Base
	has_many :sw_interactions
	validates :name, presence: true
	validates :address, presence: true
	validates :phone, presence: true
end
