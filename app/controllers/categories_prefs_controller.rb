class CategoriesPrefsController < ApplicationController

  def create
    @categories_pref = CategoriesPref.new(categories_params)
    params[:categories_pref][:category_id].each do |cat_id|
      cat = Category.find(cat_id)
      @categories_pref = CategoriesPref.new(user: current_user, category: cat)
      authorize @categories_pref
      return render 'quizzes#new' unless @categories_pref.save
    end
    redirect_to articles_path, notice: 'Your categories preferences were successfully saved.'
  end

  private

  def categories_params
    params.require(:categories_pref).permit(:category_id)
  end
end
