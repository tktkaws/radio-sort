class CommentsController < ApplicationController
  def create
    @radio = Radio.find(params[:radio_id])
    @comment = @radio.comments.build(comment_params)
    @comment.user_id = current_user.id

      if @comment.save
        render :index
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:radio_id, :user_id, :content)
  end
end