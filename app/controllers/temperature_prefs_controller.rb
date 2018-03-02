class TemperaturePrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    current_user.update(temperature_pref: params[:user][:temperature_pref])
    current_user.answered = true
    # user = current_user.edit(temperature_pref: params[:user][:temperature_pref])
    # user.answered = true
    # user.update

    if current_user.update(temperature_pref: params[:user][:temperature_pref])
      redirect_to articles_path, notice: 'Your preferences were successfully saved !'
    else
      render 'quizzes#new'
    end
  end
end
