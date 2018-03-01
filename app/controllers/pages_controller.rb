class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @articles = Article.all
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      @article_by_user = Article.find_by_user_id(user.id)
      {
        name: user.first_name + ' ' + user.last_name,
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
end
