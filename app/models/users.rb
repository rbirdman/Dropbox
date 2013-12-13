class Users < ActiveRecord::Base
	has_and_belongs_to_many :CalendarItems
	attr_accessor :id
	before_create :create_remember_token

	self.primary_key = :id

	validates :netid,  presence: true, length: { maximum: 30 }
  validates :remember_token, presence: true, length: { maximum: 55 }
  validates :privilege,  presence: true, length: { maximum: 10 }

	def Users.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def Users.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  private

    def create_remember_token
      self.remember_token = Users.encrypt(Users.new_remember_token)
    end
end