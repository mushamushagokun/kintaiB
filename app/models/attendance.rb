class Attendance < ApplicationRecord
  belongs_to :user
  
#   勤怠B6
  validates :worked_on, presence: true
 
  
#   勤怠B7,8

  validate :started_at_blank?
  
    def started_at_blank?
      if started_at.blank? && finished_at.present?
        errors.add(:finished_at, "出勤時間を入力してください")
      end
    end
  
  validate :finished_at_greater_than_started_at
    def finished_at_greater_than_started_at
      if started_at.to_i > finished_at.to_i && started_at.present? && finished_at.present?
        errors.add(:finished_at, "入力に誤りがあります")
      end
    end


  # validate :work_cannot_be_in_the_future
  #   def work_cannot_be_in_the_future
  #     if worked_on > Date.today && started_at.present? && finished_at.present?
  #       errors.add(:worked_on, "未来の編集はできません")
  #     end
  #   end
    
end