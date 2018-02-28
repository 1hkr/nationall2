class TemperaturePrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    current_user.update(temperature_pref: params[:user][:temperature_pref])
  end
end
