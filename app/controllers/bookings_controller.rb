class BookingsController < ApplicationController
  before_action :set_pet
  before_action :set_booking, only: [:show, :destroy]
  before_action :authorize_booking, except: [:index]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.pet = @pet
    @booking.user = current_user
    @booking.save
  end

  def destroy
    @booking.destroy
  end

  private

  def authorize_booking
    authorize @booking
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:pet_id, :start_date, :end_date)
  end
end
