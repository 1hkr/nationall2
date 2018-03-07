class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    filter_cat = params[:category]
    filter_temp = params[:avg_temperature]
    filter_emo = params[:avg_emotion]

    @category = Category.find_by_name(params[:category]) if filter_cat
    @articles = policy_scope(Article)
    @articles = @articles.where(category_id: @category.id) if @category
    @articles = @articles.where("avg_temperature > ? AND avg_temperature < ?", filter_temp.to_i - 0.5, filter_temp.to_i + 0.4 ) if filter_temp
    @articles = @articles.where("avg_emotion > ? AND avg_emotion < ?", filter_emo.to_i - 0.5, filter_emo.to_i + 0.4 ) if filter_emo
    @articles = @articles.where("title iLIKE ?", "%#{params[:query]}%") if params[:query].present?
    @articles = @articles.order(created_at: :desc)
  end

  def show
    @avg_rating = @article.avg_rating
    @donation = Donation.new
    @opinion = Opinion.new
    @opinions = Opinion.where(article: @article)
    @review = Review.new
    @reviews = Review.where(article: @article)
    authorize @donation
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :summary, :content, :picture, :category_id, :publishing_date)
  end
end
