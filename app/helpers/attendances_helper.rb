module AttendancesHelper
  def current_time
    Time.new(
      Time.now.year,
      Time.now.month,
      Time.now.day,
      Time.now.hour,
      Time.now.min, 0
    )
  end
  
  def working_times(started_at, finished_at)
    format("%.2f", (((finished_at - started_at) / 60) / 60.0))
  end
  
  def working_times_indicate_15minutes(started_at, finished_at)
    started_at_hour = started_at.to_s(:hour)
    started_at_minute = started_at.to_s(:min)
    started_at_indicate_15minutes = (started_at_minute.to_i)/15.truncate(0)*15
    started_at_total = ((started_at_hour.to_i)*60*60) + ((started_at_indicate_15minutes)*60)
    
    finished_at_hour = finished_at.to_s(:hour)
    finished_at_minute = finished_at.to_s(:min)
    finished_at_indicate_15minutes = (finished_at_minute.to_i)/15.truncate(0)*15
    finished_at_total = ((finished_at_hour.to_i)*60*60) + ((finished_at_indicate_15minutes)*60)
    
    format("%.2f", (((finished_at_total - started_at_total) / 60) / 60.0))
  end
  
  def working_times_sum(seconds)
    format("%.2f", seconds / 60 / 60.0)
  end
  
  def first_day(date)
  !date.nil? ? Date.parse(date) : Date.current.beginning_of_month
  end

  def user_attendances_month_date
    @user.attendances.where('worked_on >= ? and worked_on <= ?', @first_day, @last_day).order('worked_on')
  end
  
  def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
      if item[:started_at].blank? && item[:finished_at].blank?
        next
      elsif item[:started_at].blank? || item[:finished_at].blank?
        attendances = false
        break
      elsif item[:started_at] > item[:finished_at]
        attendances = false
        break
      end
    end
    return attendances
  end
  
  
end