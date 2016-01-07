class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.integer :user_id
			t.integer :property_id
			t.string :bookname
			t.string :bookemail
			t.date :startdate
			t.date :enddate
			t.boolean :booked
		end
	end
end
