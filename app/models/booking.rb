class Booking < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :property
	validates_format_of :bookemail, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, multiline:true
	validates :bookname, presence: true
	validates :bookemail, presence: true
	validates :startdate, presence: true
	validates :enddate, presence: true
end
