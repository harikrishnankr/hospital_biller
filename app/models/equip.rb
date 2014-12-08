class Equip < ActiveRecord::Base
	belongs_to :category
	validates :serial_no, presence:true, uniqueness:true, allow_blank:false
	validates :name, presence:true, uniqueness:true, allow_blank:false
	validates :cost, presence:true, allow_blank:false
	validates :bpl, presence:true, allow_blank:false
	validates :other, presence:true, allow_blank:false
	validates :category_id, presence:true, allow_blank:false
	validates_numericality_of :usage, :greater_than_or_equal_to => 0
end
