class CreateWeeklySubTasks < ActiveRecord::Migration
  def change
    create_table :weekly_sub_tasks do |t|
      t.integer :week_id
      t.integer :task_id
      t.string :task_name

      t.timestamps

    end
  end
end
