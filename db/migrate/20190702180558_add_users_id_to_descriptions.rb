class AddUsersIdToDescriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :descriptions, :user_id, :integer
  end
end
