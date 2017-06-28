class AddUserIdToLights < ActiveRecord::Migration[5.0]
  def change
    add_column :lights, :user_id, :integer
    add_index :lights, :user_id
  end
end
