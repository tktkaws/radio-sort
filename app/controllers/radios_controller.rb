class RadiosController < ApplicationController
  before_action :set_radio, only: [:show, :edit, :update, :destroy]

  def index
    @radios = Radio.all
    @like = current_user.likes
  end

  def show
    #@first = current_user.firsts.find_by(radio_id: @radio.id)
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

  #def set_radio
  #  @radio = Radio.find(params[:id])
  #end

end
