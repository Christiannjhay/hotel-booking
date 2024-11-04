class HotelsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index, :show, :create, :destroy, :update]

  def index
    @hotels = Hotel.all
    render json: @hotels, status: :ok
  end

  def show
    @hotel = Hotel.find(params[:id])
    render json: @hotel, status: :ok
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
        render json: @hotel, status: :created
    else
        render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      render json: @hotel, status: :created
    else
      render json: @hotel.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    render json: @hotel, status: :no_content
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :location, :contact, :description, amenities: [])
  end

end
