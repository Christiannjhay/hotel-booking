class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index, :show, :create, :update]

  def index
    bookings = Booking.all
    render json: bookings, status: :ok
  end

  def show
    @booking = Booking.find(params[:id])
    render json: @booking, status: :ok
  end

  def create
    @booking = Booking.new(booking_params)
  
    if @booking.customer_id.present?
      customer = Customer.find_by(id: @booking.customer_id)
      if customer
        @booking.customer_name = "#{customer.first_name} #{customer.last_name}".strip
      else
        render json: { error: 'Customer not found' }, status: :unprocessable_entity and return
      end
    end
  
    check_in_date = @booking.check_in_date.to_date
    check_out_date = @booking.check_out_date.to_date
    number_of_days = (check_out_date - check_in_date).to_i
  
   
    room = Room.find(@booking.room_id)
  
    if room.quantity > 0
      @booking.total_price = number_of_days * room.price
    else
      render json: { error: 'Room not available' }, status: :unprocessable_entity and return
    end
  
    if @booking.save
      room.update(quantity: room.quantity - 1)
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    
    old_status = @booking.status
  
    if @booking.update(booking_params)
      
      if (old_status == 'active' && (@booking.status == 'cancelled' || @booking.status == 'completed'))
        
        room = Room.find(@booking.room_id)
        room.increment!(:quantity)
      end
  
      render json: @booking, status: :ok
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:customer_id, :hotel_id, :room_id, :customer_name, :check_in_date, :check_out_date, :number_of_guests, :total_price, :status)
  end
end
