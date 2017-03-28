class ReviewsController < ApplicationController
  def create
    @traject = Traject.find(params[:traject_id])
    @user = current_user
    @review = Review.new(review_params)
    @review.traject = @traject
    @review.user = @user
    @review.save
    authorize @review
    redirect_to user_path(@user)
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end
end
