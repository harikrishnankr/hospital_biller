class Equip < ActiveRecord::Base
	belongs_to :category, dependent: :destroy
	validates :serial_no, presence:true, uniqueness:true, allow_blank:false
	validates :name, presence:true, uniqueness:true, allow_blank:false
	validates :cost, presence:true, allow_blank:false
	validates :category_id, presence:true, allow_blank:false
end
