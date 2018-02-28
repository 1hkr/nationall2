class CategoriesPrefsController < ApplicationController

  def create
    @categories_pref = CategoriesPref.new(categories_params)
    @categories_pref.user = current_user
    authorize @categories_pref

    if @categories_pref.save
      redirect_to articles_path, notice: 'Your categories preferences were successfully saved.'
    else
      render 'quizzes#new'
    end
  end

  private

  def categories_params
    params.require(:categories_pref).permit(:category_id)
  end
end
