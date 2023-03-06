class CreateJobStatusTable < ActiveRecord::Migration[6.1]
  def change
    create_table :job_statuses do |t|
      t.string :category
      t.timestamps
    end
  end
end
