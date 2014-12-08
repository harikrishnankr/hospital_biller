class Temp < ActiveRecord::Base
	validates_presence_of :unit_price,:total_price
	validates_numericality_of :unit_price,:total_price
	validates_numericality_of :qty, :greater_than_or_equal_to => 0
end
