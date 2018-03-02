class TemperaturePrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    current_user.update(temperature_pref: params[:user][:temperature_pref])

    if current_user.update(temperature_pref: params[:user][:temperature_pref])
      redirect_to articles_path, notice: 'Your temperature preferences were successfully saved.'
    else
      render 'quizzes#new'
    end
  end
end
