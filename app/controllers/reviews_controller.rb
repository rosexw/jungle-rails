class ReviewsController < ApplicationController

  def create
      review = Review.new(review_params)
      review.user_id = current_user.id
      review.product_id = params[:product_id]
      review.save!
      redirect_to products_path(:id => review.product_id)
  end

  def delete
    id = params[:id]
    review = Review.find(id)
    review.destroy!
    redirect_to products_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
