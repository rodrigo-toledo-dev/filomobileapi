class Operation < ApplicationRecord
  scope :today, -> { where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day) }

  def self.first_of_day(operation, employee)
    Operation.today.where(operation: operation, employee: employee).first
  end

  def self.end_of_day(operation, employee)
    Operation.today.where(operation: operation, employee: employee).last
  end

  def self.next_actions_for(employee)
    can_start = false
    can_stop = false
    operations = Operation.today.where(employee: employee).all
    if operations.count == 1 || operations.last.try(:operation) == 'Marcar Chegada'
      can_start = false
      can_stop = true
    else
      can_start = true
      can_stop = false
    end
    {can_start: can_start, can_stop: can_stop}
  end
end
