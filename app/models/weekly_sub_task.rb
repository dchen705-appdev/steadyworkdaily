class WeeklySubTask < ApplicationRecord
  # Direct associations

  belongs_to :week,
             :counter_cache => :weekly_tasks_count

  belongs_to :task

  # Indirect associations

  # Validations

end
