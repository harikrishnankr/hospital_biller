class User < ActiveRecord::Base
	has_secure_password

  validates :password, presence:true, allow_blank:false
  validates :username, presence:true, uniqueness:true, allow_blank:false
  validates :role, presence:true
  validates_length_of :username, :minimum=>5
  validates_length_of :password, :minimum=>5
  validates_inclusion_of :role, :in=> %w(s a)
end
