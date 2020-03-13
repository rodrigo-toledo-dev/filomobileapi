require 'rails_helper'

RSpec.describe Operation, type: :model do
  before(:each) do
    @operation = Operation.new
  end

  context "Validations" do
    it "should be invalid" do
      expect(@operation).to be_invalid
      expect(@operation.errors).to have_exactly(2).items
    end

    it "should be valid" do
      @operation.operation = 'Marcar Chegada'
      @operation.employee = Faker::Name.name
      @operation.should be_valid
    end
  end
end
