class SubscribingMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def subscribed(subscribing)
  	@subscribing = subscribing
  	mail(to: @subscribing.email, subject: 'You are subscribed to our Newsletter') 
  end

end
