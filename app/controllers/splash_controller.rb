class SplashController < ApplicationController
  def index
    @ingredients = params[:search]
    unless @ingredients.blank?
      @results = Finder.new.search(@ingredients)
    end
  end
end
