class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @articles = Article.all
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      # @article_by_user = Article.find_by_user_id(user.id)
      @article_by_user = Article.last.id
      @writer_name = user.first_name + " " + user.last_name
      @writer_location = user.city
      @writer_bio = user.bio
      {
        name: user.first_name + ' ' + user.last_name,
        bio: "<div class='writer-info'>
              <h3 id='name'>#{@writer_name}</h3>
              <h4 id='location'>#{@writer_location}</h4>
              <p id='bio'>#{@writer_bio}</p>
              </div>",
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
