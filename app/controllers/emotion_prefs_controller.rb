class EmotionPrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    current_user.update(emotion_pref: params[:user][:emotion_pref])
  end
end
