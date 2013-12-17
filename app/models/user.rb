class User < ActiveRecord::Base
  has_many :CalendarItems
	has_and_belongs_to_many :SharedCalendarItems,:class_name => "CalendarItem"
  has_many :SharedFiles
  has_many :FolderItems
  has_many :FileItems , :through => :SharedFiles

	attr_accessor :id
	before_create :create_remember_token

	self.primary_key = :id

	validates :netid,  presence: true, length: { maximum: 30 }
  validates :remember_token, presence: true, length: { maximum: 55 }
  validates :privilege,  presence: true, length: { maximum: 10 }

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