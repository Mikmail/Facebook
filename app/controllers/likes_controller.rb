class LikesController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    redirect_to root_path
  end 

  def destroy 
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(params[:id])
    @like.destroy
    redirect_to root_path
  end
end
