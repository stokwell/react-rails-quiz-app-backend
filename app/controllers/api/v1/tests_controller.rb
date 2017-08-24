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

  def update
    @test = Test.find(params[:id])
    if @test.update_attributes(test_params)
      render json: @test, status: 201
    else
      render json: { errors: @test.errors.full_messages }, status: 422
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    render json: @test
  end

  private

  def test_params
    params.require(:test).permit(:title, :description, :category, :cover)
  end

end
