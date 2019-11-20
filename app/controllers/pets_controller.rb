class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :authorize_pet, except: [:index, :new, :create]

  def index
    if params[:query].present?
      @pets = Pet.search_by_address_and_type(params[:query])
    else
      @pets = Pet.all
    end

    @pets = policy_scope(Pet)
    authorize @pets

    @markers = @pets.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
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
