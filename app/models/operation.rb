class Operation
  include Mongoid::Document
  after_initialize :setDefaultValues

  field :operation, type: String
  field :employee, type: String
  field :createdAt, type: Time
  validates :operation, :employee, :createdAt, presence: true

  protected
    def setDefaultValues
      self.createdAt = Time.now
    end
end
