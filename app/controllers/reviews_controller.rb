class ReviewsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index, :show, :create, :destroy, :update]

  def index
    @reviews = Review.all
    render json: @reviews, status: :ok
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, status: :ok
  end

  def create
    @review = Review.new(review_params)
  
   
    if @review.customer_id.present?
      customer = Customer.find_by(id: @review.customer_id)
      if customer
        @review.name = "#{customer.first_name} #{customer.last_name}".strip
      else
        render json: { error: 'Customer not found' }, status: :unprocessable_entity and return
      end
    end
  
    if @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    render json: @review, status: :no_content
  end

  private

  def review_params
    params.require(:review).permit(:hotel_id, :room_id, :review_id, :customer_id, :name, :description)
  end

end
