class AddTitleColumnToDescription < ActiveRecord::Migration[5.1]
  def change
    add_column :descriptions, :memoTitle, :string
  end
end
