class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index, :show, :create, :destroy, :update]

  def index
    @customers = Customer.all
    render json: @customers, status: :ok
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer, status: :ok
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
        render json: @customer, status: :created
    else
        render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    render json: @customer, status: :no_content
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :mobile, :password_1, :password_2, :role)
  end
end
