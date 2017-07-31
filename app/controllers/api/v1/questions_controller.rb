class Api::V1::QuestionsController < ApplicationController
  skip_before_action :authenticate_request

  before_action :answers_params, only: :create

   def answers_params
    params[:question][:answers_attributes] ||= params[:question].delete :answers
  end

  def index
    @questions = Question.all
    render json: @questions
  end


  def create
    @question = Question.new(question_params)
    @test = Test.find_by_id(params[:test_id])
    @test.questions.build
    @question.save
    render json: @question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render json: @question
  end



  private

  def question_params
    params.require(:question).permit(:body, :test_id, answers_attributes: [:id, :body, :comment, :right ] )
  end


end