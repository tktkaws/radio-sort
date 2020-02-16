class TopController < ApplicationController
  def index
    @q = Radio.ransack(params[:q])
    @radios = Radio.all
  end
end
