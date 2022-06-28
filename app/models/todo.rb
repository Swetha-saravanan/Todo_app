class Todo < ApplicationRecord
  def self.overdue
    all.where('date < ?',Date.today)
  end
  def self.due_today
    all.where('date = ?',Date.today)
  end
  def self.due_later
    all.where('date > ?',Date.today)
  end
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[]"
    "#{is_completed}    #{task}  #{date}"
  end
end
