class Public::RepliesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_member.replies.new(reply_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)
  end

  def destroy
    Reply.find(params[:id]).destroy
    redirect_to member_path(current_member.id)
  end

  private
  def reply_params
    params.require(:reply).permit(:response)
  end
end
