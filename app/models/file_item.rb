class FileItem < ActiveRecord::Base
	belongs_to :User
	has_many :SharedFiles
	has_many :users , :through => :SharedFiles,:class_name => "User"
end
