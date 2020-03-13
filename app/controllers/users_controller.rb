# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :set_search, only: %i[index relations_index]
  skip_before_action :verify_authenticity_token
  def index; end

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
    params[:q]['likes_radio_title_cont_all'] = params[:q]['likes_radio_title_cont_all'].split(/[\p{blank}\s]+/) unless params[:q].nil?
    @q = User.ransack(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    @users = @q.result(distinct: true).page(params[:page])
  end
end
