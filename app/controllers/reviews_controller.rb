class ReviewsController < ApplicationController
  before_action :set_user

  def show
  end

  def new
    @review = Review.new
    @user = current_user
  end
  # TO BE COMPLETED #
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      # redirect_to ??
    else
      render :new
    end
  end

  def edit
  end
  # TO BE COMPLETED #
  def update
    @review.update(review_params)

    # redirect_to ??
  end
  # TO BE COMPLETED #
  def destoy
    @review.destroy

    #redirect_to ??
  end

  private

    def review_params
      params.require(:review).permit(:user_id, :content)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
