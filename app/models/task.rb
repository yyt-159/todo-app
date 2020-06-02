class Task < ApplicationRecord
  validates :task, presence: true
  # validates :limit_date, presence: true
  # validates :priority, presence: true
  belongs_to :user, optional: true

end
