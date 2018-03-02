class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @articles = Article.all
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      @article_by_user = user.articles.last
      if @article_by_user
        {
          lat: user.latitude,
          lng: user.longitude,
          url: article_path(@article_by_user),
          icon: {
            url: user.picture,
            scaledSize: {
              height: 50,
              width: 50
            }
          },
        }
      end
    end
    @markers = @markers.compact
  end
end
