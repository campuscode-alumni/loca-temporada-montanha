class RemoveUserFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :user_id, :string
  end
end
