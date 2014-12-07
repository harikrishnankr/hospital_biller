class Temp < ActiveRecord::Base
	validates_presence_of :unit_price,:total_price
	validates_numericality_of :unit_price,:total_price
end
