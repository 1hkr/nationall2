class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        icon: {
          url: user.picture, #
          scaledSize: {
            height: 50,
            width: 50
          }
        },
        style: {
          'border-radius': '50%'
        }
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

    if params[:query].present?
      @articles = policy_scope(Article).where("title I LIKE ?", "%#{params[:query]}%")
    else
      @articles = policy_scope(Article).order(created_at: :desc)
    end
  end

  def show
    @donation = Donation.new
    @review = Review.new
    @reviews = Review.where(article: @article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :subtitle, :summary, :content, :picture, :category, :publishing_date)
  end
end
