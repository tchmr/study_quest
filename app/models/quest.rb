class Quest < ApplicationRecord
  belongs_to :group
  belongs_to :enemy
  validates :group_id, uniqueness: true

  def get_passed_days
    (Date.today - self.created_at.to_date).to_i
  end

  def remain_days
    result = 7 - self.get_passed_days
    if result > 0
      result
    else
      0
    end
  end

  def get_quest_finish_date(group)
    (group.quest.created_at + 60 * 60 * 24 * 7).to_date
  end

  def create_records
    self.group.users.each do |user|
      record = user.records.new({enemy_id: self.enemy.id, progress_rate: user.get_quest_progress_rate})
      record.save
    end
  end

end
