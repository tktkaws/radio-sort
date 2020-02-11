class RadiosController < ApplicationController
  before_action :set_radio, only: [:show, :edit, :update, :destroy]

  def index
    @q = Radio.ransack(params[:q])
    @radios = @q.result(distinct: true).page(params[:page])

    if user_signed_in?
    @like = current_user.likes
    end
  end

  def show
    @comments = @radio.comments
    @comment = @radio.comments.build

    @q = Radio.ransack(params[:q])
    @radios = @q.result(distinct: true).page(params[:page])
  end

  private

  def set_radio
    @radio = Radio.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:title_cont, :personality_cont)
  end

end
