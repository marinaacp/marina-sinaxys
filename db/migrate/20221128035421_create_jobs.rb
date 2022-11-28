class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :specialty
      t.string :value
      t.string :value_period
      t.string :description
      t.string :clinic_name
      t.string :clinic_city
      t.string :clinic_state

      t.timestamps
    end
  end
end
