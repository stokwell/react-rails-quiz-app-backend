class Api::V1::TestsController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @tests = Test.all
    render json: @tests, include: '**'
  end

  def new
    @test = Test.new
    render json:  @test
  end

  def show
    @test = Test.find(params[:id])
    render json: @test, include: '**'
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      render json: @test, status: 201
    else
      render json: { errors: @test.errors.full_messages }, status: 422
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :description, :category)
  end

end