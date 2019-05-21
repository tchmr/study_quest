class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs, dependent: :destroy
  has_one :member, dependent: :destroy
  has_one :group, through: :member
  has_many :records, dependent: :destroy
  has_many :enemies, through: :records

  def get_all_term_achieve_time
    sum = 0
    self.logs.each do |log|
      sum += log.achieve_time
    end
    return sum
  end

  def get_quest_term_achieve_time
    sum = 0
    quest_logs = self.logs.where('achieve_ymd > ?', self.group.quest.created_at - 60 * 60 * 24)
    quest_logs.each do |log|
      sum += log.achieve_time
    end
    return sum
  end

  def get_quest_progress_rate
    (self.get_quest_term_achieve_time.to_f / self.group.quest.enemy.hp * 100).round
  end

  def get_average_time_per_day
    quest_logs = self.logs.where('achieve_ymd > ?', self.group.quest.created_at - 60 * 60 * 24)
    if quest_logs.size == 0
      0
    else
      self.get_quest_term_achieve_time / quest_logs.size
    end
  end
end
