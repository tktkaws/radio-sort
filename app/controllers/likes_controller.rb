class LikesController < ApplicationController
  after_action :reset_row_order, only: [:sort, :create]
  skip_before_action :verify_authenticity_token

  def create
    like = current_user.likes.create(radio_id: params[:radio_id])
    redirect_to radios_url, notice: "お気に入り登録しました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to radios_url, notice: "お気に入り解除しました"
  end

  def sort
    like = Like.find(params[:like_id])
    like.update(like_params)
    render body: nil
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
