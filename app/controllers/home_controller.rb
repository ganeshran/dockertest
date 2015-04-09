class HomeController < ApplicationController
	before_action :signed_in_user, only: [:events, :gallery , :testimonials ]
	def index
	end

	def gallery
	end

	def testimonials
		@testimonials = Testimonial.all
	end

	def faq
	end

	def events
	end
end
