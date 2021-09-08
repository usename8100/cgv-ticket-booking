class User < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 50 },
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: true }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	validates :gender, presence: true
	VALID_NUMBER_REGEX = /\d[0-9]\)*\z/
	validates :phone_number, presence: true, length: { minimum: 10, maximum: 11 }, 
	format: {with: VALID_NUMBER_REGEX}

	attr_accessor :remember_token, :activation_token, :reset_token
	before_save :downcase_email
	before_create :create_activation_digest

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	
	# Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Returns true if the given token matches the digest.
	def authenticated?(attribute, token)
		digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	# Activates an account.
	def activate
		update_columns(activated: true, activated_at: Time.zone.now)
	end

	private

		# Converts email to all lower-case.
		def downcase_email
			self.email = email.downcase
		end
		# Creates and assigns the activation token and digest.
		def create_activation_digest
			self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token)
		end
end
