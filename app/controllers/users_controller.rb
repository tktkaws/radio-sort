# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :set_search, only: %i[index relations_index]
  skip_before_action :verify_authenticity_token
  def index; end

  def rank_share
    url = 'https://twitter.com/share?url=https://radio-sort.xyz&amp;text=' + share_contnets
    redirect_to url
  end

  def show
    @likes = @user.likes.rank(:row_order)
  end

  def relations_index
    @user = User.find(params[:user_id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :like_id,
                                 :password_confirmation, :row_order_position)
  end

  def set_search
    @q = User.ransack(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    @users = @q.result(distinct: true).page(params[:page]).per(8)
  end

  def share_contnets
    @likes = current_user.likes.rank(:row_order)
    tweet_content = '%23ラジオソート%0a%0a'

    @likes.first(5).each_with_index do |like, i|
      tweet_content += "#{i + 1}位: #{like.radio.title}%0a"
    end
    tweet_content += '%0a'
  end
end
