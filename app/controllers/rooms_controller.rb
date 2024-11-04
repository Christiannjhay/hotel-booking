class RoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index, :show, :create, :destroy, :update]

  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
  end
  
  def show
    @room = Room.find(params[:id])
    render json: @room, status: :ok
  end

  def create
    @room = Room.new(room_params)

    if @room.save
        render json: @room, status: :created
    else
        render json: @room.errors, status: :unprocessable_entity
    end
  end

  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    render json: @room, status: :no_content
  end

  private

  def room_params
    params.require(:room).permit(:hotel_id, :room_type, :max_persons, :description, :price, :quantity, amenities: [])
  end
  
end
