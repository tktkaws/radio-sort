class RadiosController < ApplicationController
  before_action :set_radio, only: %i(show edit update destroy)
  before_action :set_search, only: %i(index show timetable tbs lfr fmj tfm)

  def index
    if user_signed_in?
      @like = current_user.likes
    end
  end

  def show
    @comments = @radio.comments
    @comment = @radio.comments.build
  end



  def tbs
    station = "TBSラジオ"
    start_time = Time.local(2020,2,3,5,00,00)
    set_timetable(station,start_time)
  end

  def lfr
    station = "ニッポン放送"
    start_time = Time.local(2020,1,20,5,00,00)
    set_timetable(station,start_time)
  end

  def fmj
    station = "J-Wave"
    start_time = Time.local(2020,1,20,5,00,00)
    set_timetable(station,start_time)
  end

  def tfm
    station = "TOKYO FM"
    start_time = Time.local(2020,2,3,5,00,00)
    set_timetable(station,start_time)
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

  def set_search
    @q = Radio.ransack(params[:q])
    @q.sorts = 'start_time asc' if @q.sorts.empty?
    @radios = @q.result(distinct: true).page(params[:page])
  end

  def set_timetable(station,start_time)
    day = 24*60*60
    @radios_day1 = Radio.where(station: station).where(start_time: start_time...start_time+ day).order(id: "ASC")
    @radios_day2 = Radio.where(station: station).where(start_time: start_time+ day...start_time+day*2).order(id: "ASC")
    @radios_day3 = Radio.where(station: station).where(start_time: start_time+ day*2...start_time+day*3).order(id: "ASC")
    @radios_day4 = Radio.where(station: station).where(start_time: start_time+ day*3...start_time+day*4).order(id: "ASC")
    @radios_day5 = Radio.where(station: station).where(start_time: start_time+ day*4...start_time+day*5).order(id: "ASC")
    @radios_day6 = Radio.where(station: station).where(start_time: start_time+ day*5...start_time+day*6).order(id: "ASC")
    @radios_day7 = Radio.where(station: station).where(start_time: start_time+ day*6...start_time+day*7).order(id: "ASC")
  end


end