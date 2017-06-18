class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    respond_with @categories
  end
end