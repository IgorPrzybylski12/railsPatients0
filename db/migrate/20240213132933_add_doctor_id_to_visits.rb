class AddDoctorIdToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :doctor_id, :integer
    add_index :visits, :doctor_id
  end
end
