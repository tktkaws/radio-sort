# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @q = Radio.ransack(params[:q])
    @result = @q.result
    @points = @result.joins(:likes).limit(10).order('sum_point desc').group(:radio_id).sum(:point).values
    @radios = Radio.find(@result.joins(:likes).limit(10).order('sum_point desc').group(:radio_id).sum(:point).keys)
    @radios = Kaminari.paginate_array(@radios).page(params[:page])

    @users = User.order('RANDOM()').limit(4)
  end
end
