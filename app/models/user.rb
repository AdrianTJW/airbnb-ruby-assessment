class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password
	has_many :properties
	has_many :comments
	has_many :bookings

	validates :email, uniqueness: true
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, multiline:true
	validates :password, length: {in: 6..15}
end
