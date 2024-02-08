class AddUserIdToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :user_id, :integer
    add_index :visits, :user_id
  end
end
