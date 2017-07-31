class Api::V1::SubscribingsController < ApplicationController
  skip_before_action :authenticate_request

  def create
  	@subscribing = Subscribing.new(subscribing_params)
    if @subscribing.save
      SubscribingMailer.subscribed_email(@subscribing).deliver
    else
      render json: { errors: @subscribing.errors.full_messages }, status: 422
    end
  end

  private

  def subscribing_params
  	params.require(:subscribing).permit(:email)
  end

end