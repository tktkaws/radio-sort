class RadiosController < ApplicationController
  before_action :set_radio, only: [:show, :edit, :update, :destroy]

  def index
    @radios = Radio.all
    @like = current_user.likes
  end

  def show
    @comments = @radio.comments
    @comment = @radio.comments.build
  end


  #def new
  #  @radio = Radio.new
  #end

  #def destroy
  #end

  #def update
  #end

  #def edit
  #end

  private

  def set_radio
    @radio = Radio.find(params[:id])
  end

end
