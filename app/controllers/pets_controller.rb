class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authorize_pet, except: [:index, :new, :create]

  def index
    @pets = policy_scope(Pet)
    if params[:query].present?
      # @pets = Pet.search_by_address_and_type(params[:query]).joins(:bookings).joins(:reviews).order("reviews.rating")
      @pets = Pet.search_by_address_and_type(params[:query]).sort_by { |pet| - pet.average_rating }
      @query = params[:query]
    else
      @pets = Pet.all.sort_by { |pet| - pet.average_rating }
    end

    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
        @booking = Booking.new

  end

  def show
    @booking = Booking.new
    @markers = [{lat: @pet.latitude, lng: @pet.longitude}]
  end

  def new
    @pet = Pet.new
    authorize_pet
    @user = current_user
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize_pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)

    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy

    # show page for user
    redirect_to pets_path
  end

  private

  def authorize_pet
    authorize @pet
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:user_id, :name, :description, :photo, :address, :price, :type)
  end
end
