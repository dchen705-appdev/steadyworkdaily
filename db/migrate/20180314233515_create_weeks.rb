class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :user_id

      t.timestamps

    end
  end
end
