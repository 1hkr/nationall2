class DonationsController < ApplicationController
  before_action :set_article

  def create
    @donation = Donation.new(donation_params)
    @donation.article = @article
    @donation.user = current_user
    if @donation.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
