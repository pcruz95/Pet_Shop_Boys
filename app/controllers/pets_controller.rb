class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update]
  before_action :set_user, except: [:index]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = @user
    if @pet.save
      redirect_to pets_show_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)

    redirect_to pets_show_path(@pet)
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def pet_params
    params.require(:pet).permit(:user_id, :name, :description, :photo, :address, :price, :type)
  end
end
