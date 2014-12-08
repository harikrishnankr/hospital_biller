class Sum < ActiveRecord::Base
	validates_numericality_of :total, :greater_than_or_equal_to => 0
end
