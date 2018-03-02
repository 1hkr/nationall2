class TemperaturePrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    if current_user.update(temperature_pref: params[:user][:temperature_pref], answered: true)
      redirect_to articles_path, notice: 'Your preferences were successfully saved !'
    else
      render 'quizzes#new'
    end
  end
end
