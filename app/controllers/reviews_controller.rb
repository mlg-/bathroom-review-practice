class ReviewsController < ApplicationController
  def new
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bathroom = Bathroom.find(params[:bathroom_id])

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to bathroom_path(@bathroom)
    else
      flash[:error] = @review.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body).merge(bathroom: Bathroom.find(params[:bathroom_id]))
  end
end
