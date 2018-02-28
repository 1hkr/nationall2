class EmotionPrefsController < ApplicationController

  def create
    current_user.emotion_pref = params[:emotion_pref]
  end
end
