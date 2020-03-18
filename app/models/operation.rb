class Operation < ApplicationRecord
  scope :today, -> { where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) }
  # Ex:- scope :active, -> {where(:active => true)}
end
