class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
	  @post = @user.posts.build(text: params[:text], image: params[:image])
	  @post.save
	end
end
