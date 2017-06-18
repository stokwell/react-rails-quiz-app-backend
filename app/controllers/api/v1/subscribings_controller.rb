class Api::V1::SubscribingsController < ApplicationController
  
  def create 
  	@subscribing = Subscribing.new(subscribing_params)
    if @subscribing.save 
      SubscribingMailer.subscribed_email(@subscribing).deliver
    end
  end

  private 

  def subscribing_params
  	params.require(:subscribing).permit(:email)
  end

end