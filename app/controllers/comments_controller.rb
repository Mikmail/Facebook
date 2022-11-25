class CommentsController < ApplicationController
  before_action :find_post

  def index 
    @comments = Comment.all 
  end

  def new 
    @comment = Comment.new
  end
  
  def create 
    @comment = @post.comments.build(comment_params)
    if @comment.save 
      redirect_to root_path
    else 
      render :new 
    end 
  end

  def destroy 
    @comment = @post.comments.find(params[:id])
    @comment.destroy 
    redirect_to root_path
  end

  private 

  def find_post 
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:title, :commenter)
  end
end
