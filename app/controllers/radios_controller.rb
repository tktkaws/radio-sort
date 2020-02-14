class RadiosController < ApplicationController
  before_action :set_radio, only: [:show, :edit, :update, :destroy]

  def index
    @q = Radio.ransack(params[:q])
    @q.sorts = 'start_time asc' if @q.sorts.empty?
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

  def ranking
    @q = Radio.ransack(params[:q])
    @result = @q.result
    @points = @result.joins(:likes).limit(10).order('sum_point desc').group(:radio_id).sum(:point).values
    @radios = Radio.find(@result.joins(:likes).limit(10).order('sum_point desc').group(:radio_id).sum(:point).keys)
    @radios = Kaminari.paginate_array(@radios).page(params[:page])

    if params[:q].present?
      if params[:q][:likes_user_gender_eq].present?
        gender = params[:q][:likes_user_gender_eq]
        @gender = User.genders_i18n.values[gender.to_i]
      else
        @gender = "性別問わず"
      end
      if params[:q][:likes_user_age_eq].present?
        age = params[:q][:likes_user_age_eq]
        @age = User.ages_i18n.values[age.to_i]
      else
        @age = "全年代"
      end
      if params[:q][:station_eq].present?
        @station = params[:q][:station_eq]
      else
        @station = "全放送局"
      end

    end
    if user_signed_in?
      @like = current_user.likes
    end
  end

  private

  def set_radio
    @radio = Radio.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:title_cont, :personality_cont)
  end
end