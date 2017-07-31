class Api::V1::CategoriesController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @categories = Category.all
    respond_with @categories
  end
end