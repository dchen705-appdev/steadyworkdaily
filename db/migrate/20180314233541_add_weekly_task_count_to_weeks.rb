class AddWeeklyTaskCountToWeeks < ActiveRecord::Migration[5.0]
  def change
    add_column :weeks, :weekly_tasks_count, :integer
  end
end
