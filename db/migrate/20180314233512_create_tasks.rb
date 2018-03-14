class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.datetime :deadline
      t.string :status
      t.string :name

      t.timestamps

    end
  end
end
