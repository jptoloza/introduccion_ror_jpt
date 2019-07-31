class AddRolToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rol, :integer, default: 1
  end
end
