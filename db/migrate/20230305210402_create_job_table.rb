class CreateJobTable < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.float :latitude
      t.float :longitude
      t.string :description
      t.integer :service_person_id
      t.integer :job_status_id
      t.timestamps
    end
  end
end
