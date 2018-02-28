class TemperaturePrefsController < ApplicationController
  def create
    current_user.temperature_pref = params[:temperature_pref]
  end
end
