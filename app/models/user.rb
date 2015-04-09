class User < ActiveRecord::Base
	has_many :sw_interactions, dependent: :destroy
	has_secure_password
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@advisory\.com\z/
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :email, format: { with: VALID_EMAIL_REGEX , message: ': Please use a valid Advisory email to sign up'}

	before_create :create_remember_token

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end

end
