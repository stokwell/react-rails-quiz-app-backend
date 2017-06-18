class Api::V1::EventsController < ApplicationController

	def index
    @events = Event.all.order(:id).reverse
    @categories = Category.all
	  respond_with @events
	end

	def show
	  @event = Event.find(params[:id])
	  respond_with @event
	end

	def create
	  @event = Event.new(event_params)
	if @event.save
	  render json: @event, status: 201
	else
	  render json: { errors: @event.errors.full_messages }, status: 422
	end
	end

	def destroy
	  @event = Post.find(params[:id])
	  @event.destroy
	  respond_with @event
	end


	private

	def event_params
	  params.require(:event).permit(:title, :description, :cover  )
	end

end

