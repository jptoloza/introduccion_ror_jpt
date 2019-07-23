class ModifyLastnameUser < ActiveRecord::Migration[5.2]
	def change
		rename_column :users, :lastname_name, :last_name
	end
end
