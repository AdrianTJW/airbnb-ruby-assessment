class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :propertyname
			t.string :description
			t.string :location
			t.string :email
			t.integer :user_id
			t.timestamps null:false
		end
	end
end
