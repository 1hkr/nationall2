class ReviewsController < ApplicationController
  before_action :set_article, only: [:create]

  def create
    @reviews = Review.where(article: @article)
    @review = Review.new(review_params)
    @review.article = @article # assignment in order to associate article with review
    @review.user = current_user

    if @review.save
      redirect_to article_path(@article), notice: 'Review was successfully created.'
    else
      render 'articles/show', article: @article, reviews: @reviews, donation: @donation
      # render goes to View folder by default
      # should render the view with specific instances
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :emotion, :temperature)
  end
end
