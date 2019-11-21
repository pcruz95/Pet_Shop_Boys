class BookingsController < ApplicationController
  before_action :set_pet
  before_action :set_booking, only: [:show, :destroy]
  before_action :authorize_booking, except: [:index, :new, :create]

  def show
    @markers = [{lat: @pet.latitude, lng: @pet.longitude}]

    if @booking.review.nil?
      @review = Review.new
    else
      @review = @booking.review
    end
  end

  def new
    @booking = Booking.new
    authorize_booking
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.pet = @pet
    @booking.user = current_user
    authorize_booking
    if @booking.save
      redirect_to pet_booking_path(@pet, @booking)
    else
      flash[:error] = 'There was an error creating your booking!'
      render :new
    end
  end

  def destroy
    @booking.destroy

    redirect_to pets_path
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
