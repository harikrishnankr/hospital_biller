class Category < ActiveRecord::Base
	has_many :equips
	validates :type_name, presence:true, uniqueness:true, allow_blank:false
end
