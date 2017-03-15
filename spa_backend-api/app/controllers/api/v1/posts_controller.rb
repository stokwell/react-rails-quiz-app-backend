class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all.order(:id).reverse
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: 201
    else
      render json: { errors: @post.errors.full_messages }, status: 422
    end
  end

  def destoy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :username)
  end
  
end