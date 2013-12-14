class SharedFile < ActiveRecord::Base
	belongs_to :FileItem,:primary_key => :id
	belongs_to :User ,:primary_key => :id
end
 