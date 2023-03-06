class CreateServicePersonTable < ActiveRecord::Migration[6.1]
  def change
    create_table :service_people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :job_id
      t.timestamps
    end
  end
end
