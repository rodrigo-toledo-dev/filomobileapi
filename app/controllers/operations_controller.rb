class OperationsController < ApplicationController
  before_action :set_operations
  before_action :set_operation, only: :create

  def index
    render json: @operations, status: :ok
  end

  def create
    begin
      @operation.save
      @operations = Operation.where(employee: @operation.employee)
      render json: @operations, status: :ok
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  protected
  def set_operations
    @operations = Operation.where(employee: params[:employee])
  end

  def set_operation
    @operation = Operation.new(operation: params[:operation], employee: params[:employee]) if params[:operation]
  end
end
