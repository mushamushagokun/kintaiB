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

