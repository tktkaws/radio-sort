# frozen_string_literal: true

class RadiosController < ApplicationController
  before_action :set_radio, only: %i[show]
  before_action :set_search, only: %i[index show]

  def index
    @like = current_user.likes if user_signed_in?

    return unless request.xhr?

    render 'radios/index'
  end

  def show
    @comments = @radio.comments
    @comment = @radio.comments.build
  end

  def ranking
    @q = Radio.ransack(params[:q])
    @result = @q.result
    @points = @result.joins(:likes).limit(20).order('sum_point desc').group(:radio_id).sum(:point).values
    @radios = Radio.find(@result.joins(:likes).limit(20).order('sum_point desc').group(:radio_id).sum(:point).keys)
    @radios = Kaminari.paginate_array(@radios).page(params[:page])

    if params[:q].present?
      if params[:q][:likes_user_gender_eq].present?
        gender = params[:q][:likes_user_gender_eq]
        @gender = User.genders_i18n.values[gender.to_i]
      else
        @gender = '性別問わず'
      end
      if params[:q][:likes_user_age_eq].present?
        age = params[:q][:likes_user_age_eq]
        @age = User.ages_i18n.values[age.to_i]
      else
        @age = '全年代'
      end
      @station = params[:q][:station_eq].presence || '全放送局'

    end
    @like = current_user.likes if user_signed_in?
  end

  private

  def set_radio
    @radio = Radio.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:title_cont, :personality_cont)
  end

  def set_search
    @q = Radio.ransack(params[:q])
    @q.sorts = 'start_time asc' if @q.sorts.empty?
    @radios = @q.result(distinct: true).page(params[:page]).per(20)
  end
end
