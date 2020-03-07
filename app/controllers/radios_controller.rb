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
    @monday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,3,5,00,00)...Time.local(2020,2,4,5,00,00))
    @tuesday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,4,5,00,00)...Time.local(2020,2,5,5,00,00))
    @wendsday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,5,5,00,00)...Time.local(2020,2,6,5,00,00))
    @thursday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,6,5,00,00)...Time.local(2020,2,7,5,00,00))
    @friday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,7,5,00,00)...Time.local(2020,2,8,5,00,00))
    @saturday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,8,5,00,00)...Time.local(2020,2,9,5,00,00))
    @sunday_tbs_radios = Radio.where(station: "TBSラジオ").where(start_time: Time.local(2020,2,9,5,00,00)...Time.local(2020,2,10,5,00,00))
  end

  def lfr
    @monday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,20,5,00,00)...Time.local(2020,1,21,5,00,00))
    @tuesday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,21,5,00,00)...Time.local(2020,1,22,5,00,00))
    @wendsday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,22,5,00,00)...Time.local(2020,1,23,5,00,00))
    @thursday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,23,5,00,00)...Time.local(2020,1,24,5,00,00))
    @friday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,24,5,00,00)...Time.local(2020,1,25,5,00,00))
    @saturday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,25,5,00,00)...Time.local(2020,1,26,5,00,00))
    @sunday_lf_radios = Radio.where(station: "ニッポン放送").where(start_time: Time.local(2020,1,26,5,00,00)...Time.local(2020,1,27,5,00,00))
  end

  def fmj
    @monday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,20,5,00,00)...Time.local(2020,1,21,5,00,00))
    @tuesday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,21,5,00,00)...Time.local(2020,1,22,5,00,00))
    @wendsday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,22,5,00,00)...Time.local(2020,1,23,5,00,00))
    @thursday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,23,5,00,00)...Time.local(2020,1,24,5,00,00))
    @friday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,24,5,00,00)...Time.local(2020,1,25,5,00,00))
    @saturday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,25,5,00,00)...Time.local(2020,1,26,5,00,00))
    @sunday_fmj_radios = Radio.where(station: "J-Wave").where(start_time: Time.local(2020,1,26,5,00,00)...Time.local(2020,1,27,5,00,00))
  end

  def tfm
    @monday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,3,5,00,00)...Time.local(2020,2,4,5,00,00))
    @tuesday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,4,5,00,00)...Time.local(2020,2,5,5,00,00))
    @wendsday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,5,5,00,00)...Time.local(2020,2,6,5,00,00))
    @thursday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,6,5,00,00)...Time.local(2020,2,7,5,00,00))
    @friday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,7,5,00,00)...Time.local(2020,2,8,5,00,00))
    @saturday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,8,5,00,00)...Time.local(2020,2,9,5,00,00))
    @sunday_tfm_radios = Radio.where(station: "TOKYO FM").where(start_time: Time.local(2020,2,9,5,00,00)...Time.local(2020,2,10,5,00,00))
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
end