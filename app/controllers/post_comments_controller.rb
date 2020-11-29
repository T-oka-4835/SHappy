class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @stress = Stress.find(params[:stress_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.stress_id = @stress.id
    @comment.save
    @comments = @stress.comments
  end

  def destroy
    @stress = Stress.find(params[:stress_id])
    post_comment = @stress.post_comments.find(params[:id])
    post_comment.destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
