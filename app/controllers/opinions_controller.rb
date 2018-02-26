class OpinionsController < ApplicationController
  before_action :find_article, only: [:edit, :update, :destroy]

  def show
    @opinions = Opinion.where(article: @article)
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.user = current_user
    @opinion.article = @article

    if @opinion.save
      redirect_to artilce_path(@article), notice: 'Opinion was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @opinion.update(opinion_params)
      redirect_to article_path(@article), notice: 'opinion was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @opinion.destroy
    redirect_to article_path(@article), notice: 'opinion was successfully destroyed.'
  end

  private

  def find_opinion
    @opinion = opinion.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
