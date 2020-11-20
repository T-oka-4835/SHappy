class PostCommentsController < ApplicationController
  def create
    stress = Stress.find(params[:stress_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.stress_id = stress.id
    comment.save
    redirect_to stress_path(stress)
  end

  def destroy
    PostComment.find_by(id: params[:id], stress_id: params[:stress_id]).destroy
    redirect_to stress_path(params[:stress_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
