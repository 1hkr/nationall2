class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find_by_name(params[:category]) if params[:category]
    @articles = policy_scope(Article)
    @articles = @articles.where(category_id: @category.id) if @category
    @articles = @articles.where(avg_rating: @avg_rating) if @avg_rating
    @articles = @articles.where("title iLIKE ?", "%#{params[:query]}%") if params[:query].present?
    @articles = @articles.order(created_at: :desc)
  end

  def show
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
.emot
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
