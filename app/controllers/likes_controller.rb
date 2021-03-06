# frozen_string_literal: true

class LikesController < ApplicationController
  after_action :reset_row_order, only: %i[sort create]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    @radio = Radio.find(params[:radio_id])
    like = current_user.likes.build(radio_id: params[:radio_id])
    like.save
  end

  def destroy
    @radio = Radio.find(params[:id])
    like = Like.find_by(radio_id: params[:id], user_id: current_user.id)
    like.destroy
  end

  def sort
    like = Like.find(params[:like_id])
    if like.user_id == current_user.id
      like.update(like_params)
      render body: nil
    end
  end

  def reset_row_order
    likes = current_user.likes
    likes.rank(:row_order).each_with_index do |f, i|
      f.update_attribute :row_order, i + 1
      if i > 4
        f.update_attribute :point, 1
      else
        f.update_attribute :point, 10 - (i * 2)
      end
    end
  end

  private

  def like_params
    params.require(:like).permit(:row_order_position)
  end
end
