class Api::V1::SemestersController < ApplicationController

  def show_week
    @semester = Semester.find(params[:id])
    @week = @semester.which_week
    respond_to do |format|
      format.json { render json: @week }
    end
  end

end