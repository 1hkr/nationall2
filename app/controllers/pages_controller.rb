class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @articles = Article.all
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      @article_by_user = user.articles.last
      if @article_by_user
        {
          lat: user.latitude + rand(-0.5..0.5).round(6),
          lng: user.longitude + rand(-0.5..0.5).round(6),
          name: user.first_name + " " + user.last_name,
          location: user.city,
          date: @article_by_user.publishing_date,
          latest_article_title: user.articles.last.title,
          latest_article_content: user.articles.last.content.first(120)+"...",
          url: article_path(@article_by_user),
          imageUrl: @article_by_user.picture,
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
