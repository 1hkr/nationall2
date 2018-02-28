class QuizzesController < ApplicationController

  def new
    @categories_pref = CategoriesPref.new
    authorize @categories_pref
  end

end
