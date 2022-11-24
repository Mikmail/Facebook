class PostsController < ApplicationController
  before_action :require_login 
  
  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save 
      redirect_to root_path
    else 
      redirect_to @user
    end 
  end

  private 

  def require_login
    unless current_user 
      redirect_to new_user_session_path
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :user_id)
  end
end
