class OperationsController < ApplicationController
  before_action :set_operations
  before_action :set_operation, only: :create

  def index
    render json: @operations, status: :ok
  end

  def create
    begin
      @operation.save
      set_operations
      render json: @operations, status: :ok
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def next_actions_for
    render json: Operation.next_actions_for(params[:employee]), status: :ok
  end

  protected
  def set_operations
    @operations = Operation.today.where(employee: params[:employee])
  end

  def set_operation
    @operation = Operation.find_or_initialize_by(params[:operation], params[:employee])
  end
end
