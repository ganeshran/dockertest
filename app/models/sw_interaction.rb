class SwInteraction < ActiveRecord::Base
	belongs_to :user
	belongs_to :organization
	validates :user_id, presence: true
	validates :organization_id, presence:true
	validates :volunteerHours, presence: true, numericality: true
	validate :start_must_be_before_end_time
	validates :comment, length: {maximum:200}

	private 
	def start_must_be_before_end_time
		errors.add(:fromactivitydate, "and To Date must be present and From Date must be before To Date") unless
		!self.fromactivitydate.nil? and !self.toactivitydate.nil? and self.fromactivitydate <= self.toactivitydate
	end 
end
