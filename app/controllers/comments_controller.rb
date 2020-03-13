# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @radio = Radio.find(params[:radio_id])
    @comment = @radio.comments.build(comment_params)
    @comment.user_id = current_user.id

    render :index if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    render :index if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:radio_id, :user_id, :content)
  end
end
