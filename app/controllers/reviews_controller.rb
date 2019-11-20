class ReviewsController < ApplicationController
  # before_action :set_user

  # def show
  # end

  # def new
  #   @review = Review.new
  #   @user = current_user
  # end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review

    # @review = Review.new(review_params)
    # @review.user = current_user
    if @review.save
      redirect_to pet_booking_path(@booking.pet, @booking)
    else
      flash[:error] = "There was an error making your reivew. Please try again!"
      redirect_to pet_booking_path(@booking.pet, @booking)
    end
  end
  
  # def edit
  # end

  # def update
  #   @review.update(review_params)

  #   redirect_to pet_path(@pet)
  # end

  # def destoy
  #   @review.destroy

  #   redirect_to reviews_path
  # end

  private

    def review_params
      params.require(:review).permit(:content, :rating)
    end

    # def set_user
    #   @user = User.find(params[:id])
    # end
end
