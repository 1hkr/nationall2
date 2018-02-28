class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home]

  def home
    @articles = Article.all
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        draggable: true,
        icon: {
          url: user.picture,
          scaledSize: {
            height: 50,
            width: 50
          }
          },
        shape: {
          coords: [1, 1, 1, 20, 18, 20, 18, 1],
          type: 'poly'
        },
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end
end
