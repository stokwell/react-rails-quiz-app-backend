class Api::V1::SubscribingsController < ApplicationController
  
  def create 
  	@subscribing = Subscribing.new(subscribing_params)

  	respond_to do |format|
      if @subscribing.save 
        SubscribingMailer.subscribed(@subscribing).deliver
        format.json { render @subscribing }
	end
  end

  private 

  def subscribing_params
  	params.require(:subscribing).permit(:email)
  end

end