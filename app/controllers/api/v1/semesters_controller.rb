class Api::V1::SemestersController < ApplicationController
  #skip_before_action :authenticate_request
  SEMESTER = YAML.load_file("#{Rails.root}/config/semester_config.yml")

  def get_study_days
    current_semester = SEMESTER.select{|_,v| v['current'] }
    first_study_day = Date.parse(current_semester.values[0]['start'])
    last_study_day = Date.parse(current_semester.values[0]['end'])

    whole_semester_array = (first_study_day..last_study_day).to_a

    holidays = current_semester.values[0]['holidays']
    holidays_ranges = holidays.map { |x| (Date.parse(x['start'])..Date.parse(x['end'])).to_a }

    holidays_array = holidays_ranges.flatten
    @study_days = whole_semester_array - holidays_array
    return @study_days
  end

  def which_week
    get_study_days
    current_date = Date.today
    if @study_days.include?(current_date)
      study_days_weeks = @study_days.slice_before{|x| x.wday == 1 }.to_a
      week_number ||= study_days_weeks.find_index{|i| i.detect{|x| x == current_date }}.to_i + 1
      @week = { week: week_number }
    else
      @week = { week: 0 }
    end
    respond_with @week
  end

  def return_dates
    get_study_days
    @date = params[:date].to_date
    @dates = @study_days.find_all {|x| x.wday == @date.wday if x > @date}
    render json: { dates:  @dates }
  end

  def yml_to_json
    @semester_info = JSON.pretty_generate(YAML.load_file("#{Rails.root}/config/semester_config.yml"))
    respond_with @semester_info
  end

end