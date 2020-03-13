require 'rails_helper'

RSpec.describe OperationsController, type: :controller do

  before(:all) do
    @first_employee ||= Faker::Name.name
    @second_employee ||= Faker::Name.name
    10.times.each do
      Operation.create(employee: @first_employee, operation: 'Marcar Chegada')
      Operation.create(employee: @first_employee, operation: 'Marcar Saída')
      Operation.create(employee: @second_employee, operation: 'Freelancer')
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns all operations" do
      get :index, params: {employee: @first_employee}
      assigns(:operations).should have(20).items
    end
  end

  describe "POST #create" do
    context 'Success' do
      it "returns http success" do
        post :create, params: {employee: Faker::Name.name, operation: 'Marcar Chegada'}
        expect(response).to have_http_status(:success)
      end
      
      it "returns operations and now actual" do
        post :create, params: {employee: Faker::Name.name, operation: 'Marcar Chegada'}
        assigns(:operations).should have(1).items
      end
    end

    context 'Failure' do
      it "fail when try create" do
        post :create
        expect(response).to have_http_status(:error)
      end
    end
    
  end

end
