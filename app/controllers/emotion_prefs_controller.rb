class EmotionPrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    current_user.update(emotion_pref: params[:user][:emotion_pref])

    if current_user.update(emotion_pref: params[:user][:emotion_pref])
      redirect_to articles_path, notice: 'Your emotion preferences were successfully saved.'
    else
      render 'quizzes#new'
    end
  end
end
