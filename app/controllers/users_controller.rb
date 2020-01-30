class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    if params[:q] != nil
      params[:q]['likes_radio_title_cont_all'] = params[:q]['likes_radio_title_cont_all'].split(/[\p{blank}\s]+/)
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
      else
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    end
  end

  def new
  end

  def create
  end

  def show
    @likes = @user.likes.rank(:row_order)
  end

  def relations_index
    @user = User.find(params[:user_id])
    if params[:q] != nil
      params[:q]['likes_radio_title_cont_all'] = params[:q]['likes_radio_title_cont_all'].split(/[\p{blank}\s]+/)
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    else
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    end

  end


  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :like_id,
                                 :password_confirmation, :row_order_position)
  end
end
