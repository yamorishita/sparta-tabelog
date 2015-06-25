class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_restaurant, only: [:new, :create, :edit, :update]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      title: review_params["title"],
      body: review_params["body"],
      rate: review_params["rate"].to_f
    )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      title: review_params["title"],
      body: review_params["body"],
      rate: review_params["rate"].to_f
    )
      redirect_to restaurant_url(@review.restaurant)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rate)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
