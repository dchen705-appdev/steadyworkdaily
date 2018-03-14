class Week < ApplicationRecord
  # Direct associations

  has_many   :weekly_tasks,
             :class_name => "WeeklySubTask",
             :dependent => :nullify

  belongs_to :user

  # Indirect associations

  # Validations

end
