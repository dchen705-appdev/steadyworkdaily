class Task < ApplicationRecord
  # Direct associations

  has_many   :weekly_sub_tasks,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
