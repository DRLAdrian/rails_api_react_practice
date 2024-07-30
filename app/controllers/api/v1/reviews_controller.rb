class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_review, only: %i[destroy]

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: ReviewSerializer.new(@review).serializable_hash.to_json, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    if @review.destroy
      head :no_content
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:title, :description, :score, :airline_id)
  end
end
