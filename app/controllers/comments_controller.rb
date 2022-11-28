class CommentsController < ApplicationController
  before_action :find_post

  def index 
    @comments = Comment.all 
  end

  def new 
    @comment = Comment.new
  end
  
  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to root_path
  end

  def destroy 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy 
    redirect_to root_path
  end

  private 

  def find_post 
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commenter_id)
  end
end
