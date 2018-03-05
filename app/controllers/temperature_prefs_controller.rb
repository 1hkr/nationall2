class TemperaturePrefsController < ApplicationController
  skip_after_action :verify_authorized

  def update
    if params[:user] && current_user.update(temperature_pref: params[:user][:temperature_pref], answered: true)
      redirect_to articles_path, notice: 'Your preferences were successfully saved !'
    else
      @categories_pref = CategoriesPref.new
      redirect_to new_quiz_path, notice: '!! Your need to answer all questions please !!'
    end
  end
end
