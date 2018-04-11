class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_article, only: [:create, :edit, :destroy]

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user)
    authorize @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to articles_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to articles_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_article
    @user = User.find(params[:article_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :email, :password, :bio, :picture, :emotion_pref, :temperature_pref, :badge, :link)
  end
end
