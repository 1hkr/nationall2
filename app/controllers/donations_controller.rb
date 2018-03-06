class DonationsController < ApplicationController
  before_action :set_article
  before_action :set_donation

  def create
    @donation = Donation.new(donation_params)
    @donation.article = @article
    @donation.user = current_user
    authorize @donation
    if @donation.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  def destroy
    authorize @donation
    @donation.destroy
    redirect_to article_path(@article), notice: 'Donation was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_donation
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
