class Attendance < ApplicationRecord
  belongs_to :user
  
#   勤怠B6
  validate :add_error_worked_on
 
  def add_error_worked_on
    if worked_on.blank?
      errors.add(:worked_on, "日付は必ず入力して下さい")
    end
  end
  
 
  
#   勤怠B7,8

  


end