class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.string :topic
      t.string :patient
      t.string :doctor
      t.datetime :begining
      t.datetime :ending

      t.timestamps
    end
  end
end
