class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :comments
	has_many :bookings
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, multiline:true
	validates :propertyname, presence: true
	validates :description, presence: true
	validates :location, presence: true
	validates :email, presence: true
end
