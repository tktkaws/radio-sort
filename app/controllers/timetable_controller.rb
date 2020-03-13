# frozen_string_literal: true

class TimetableController < ApplicationController
  before_action :set_search, only: %i[tbs lfr fmj tfm]

  def tbs
    station = 'TBSラジオ'
    start_time = Time.zone.local(2020, 2, 3, 5, 0o0, 0o0)
    set_timetable(station, start_time)
  end

  def lfr
    station = 'ニッポン放送'
    start_time = Time.zone.local(2020, 1, 20, 5, 0o0, 0o0)
    set_timetable(station, start_time)
  end

  def fmj
    station = 'J-Wave'
    start_time = Time.zone.local(2020, 1, 20, 5, 0o0, 0o0)
    set_timetable(station, start_time)
  end

  def tfm
    station = 'TOKYO FM'
    start_time = Time.zone.local(2020, 2, 3, 5, 0o0, 0o0)
    set_timetable(station, start_time)
  end

  private

  def set_search
    @q = Radio.ransack(params[:q])
    @q.sorts = 'start_time asc' if @q.sorts.empty?
    @radios = @q.result(distinct: true).page(params[:page])
  end

  def set_timetable(station, start_time)
    day = 24 * 60 * 60
    @radios_day1 = Radio.where(station: station).where(start_time: start_time...start_time + day).order(id: 'ASC')
    @radios_day2 = Radio.where(station: station).where(start_time: start_time + day...start_time + day * 2).order(id: 'ASC')
    @radios_day3 = Radio.where(station: station).where(start_time: start_time + day * 2...start_time + day * 3).order(id: 'ASC')
    @radios_day4 = Radio.where(station: station).where(start_time: start_time + day * 3...start_time + day * 4).order(id: 'ASC')
    @radios_day5 = Radio.where(station: station).where(start_time: start_time + day * 4...start_time + day * 5).order(id: 'ASC')
    @radios_day6 = Radio.where(station: station).where(start_time: start_time + day * 5...start_time + day * 6).order(id: 'ASC')
    @radios_day7 = Radio.where(station: station).where(start_time: start_time + day * 6...start_time + day * 7).order(id: 'ASC')
  end
end
