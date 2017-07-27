class Api::V1::EventsController < ApplicationController
	skip_before_action :authenticate_request, only: [:index]

	def index
    @events = Event.all.order(:id).reverse
    @categories = Category.all
	  respond_with @events
	end

	def user_events
		@user = User.find(params[:id])
	  @user_events = @user.events
	  respond_with @user_events
	end

	def create
	  @event = Event.new(event_params)
	  @event.user = current_user
	  @category = Category.find_by_id(params[:event][:category_id])
    @event.save
    @event.categorizations.create(category: @category)
	  render json: @event, status: 201
	end

	def destroy
	  @event = Event.find(params[:id])
	  @event.destroy
	  respond_with @event
	end


	private

	def event_params
	  params.require(:event).permit(:title, :description, :cover )
	end

end

