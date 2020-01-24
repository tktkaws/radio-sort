class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
    @likes = @user.likes.rank(:row_order)
  end

  def show_relations
    @user = User.find(params[:user_id])
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
