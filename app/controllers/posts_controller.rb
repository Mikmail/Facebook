class PostsController < ApplicationController
  before_action :require_login 
  
  def index
    @posts = Post.all 
  end

  def show 
    @post = Post.find(params[:id])
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

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def require_login
    unless current_user 
      redirect_to new_user_session_path
    end
  end
  
  def post_params
    params.require(:post).permit(:title)
  end
end
