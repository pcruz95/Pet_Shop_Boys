class UsersController < ApplicationController
  before_action :find_user_by_id, exclude: [:show]
  before_action :authorize_user, exclude: [:show]

  def show
    @user = User.includes(:bookings, :pets).find(params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def find_user_by_id
    @user = User.find(params[:id])
  end

  def authorize_user
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :address, :email)
  end
end

# made user controller
# made user policy
# set show?
# to be user == record.user
# did authorize @user in show user controller
# created a show view


# >> @user.pets.first.bookings
# => #<ActiveRecord::Associations::CollectionProxy [#<Booking id: 4, user_id: 10, pet_id: 2, start_date: "2019-12-11", end_date: "2019-12-12", created_at: "2019-11-19 13:59:57", updated_at: "2019-11-19 13:59:57">, #<Booking id: 9, user_id: 10, pet_id: 2, start_date: "2019-12-04", end_date: "2019-12-10", created_at: "2019-11-19 13:59:57", updated_at: "2019-11-19 13:59:57">, #<Booking id: 10, user_id: 1, pet_id: 2, start_date: "2019-11-29", end_date: "2019-12-06", created_at: "2019-11-19 13:59:57", updated_at: "2019-11-19 13:59:57">]>
