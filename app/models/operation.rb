class Operation < ApplicationRecord
  scope :today, -> { where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) }

  def self.first_of_day(operation, employee)
    Operation.today.where(operation: operation, employee: employee).first
  end

  def self.end_of_day(operation, employee)
    Operation.today.where(operation: operation, employee: employee).last
  end
end
