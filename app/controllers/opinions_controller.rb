class OpinionsController < ApplicationController
  before_action :set_article, only: [:create, :edit, :update, :destroy]

  def create
    @opinions = Opinion.where(article: @article)
    @opinion = Opinion.new(opinion_params)
    @opinion.article = @article
    @opinion.user = current_user
    authorize @opinion

    if @opinion.save
      redirect_to article_path(@article), notice: 'Opinion was successfully created.'
    else
      render 'articles/show', article: @article, reviews: @reviews, opinions: @opinion, donation: @donation
    end
  end

  def edit
    authorize @opinion
  end

  def update
    authorize @opinion
    if @opinion.update(opinion_params)
      redirect_to article_path(@article), notice: 'Opinion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @opinion
    @opinion.destroy
    redirect_to article_path(@article), notice: 'Opinion was successfully destroyed.'
  end

  private

   def set_article
     @article = Article.find(params[:article_id])
   end

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
