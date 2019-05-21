class Enemy < ApplicationRecord
  has_many :quests, dependent: :destroy
  has_many :groups, through: :quests
  has_many :records, dependent: :destroy
  has_many :users, through: :records

  # 基準HPをgroup.usersの人数倍する
  def get_full_hp(group)
     self.hp * group.users.size
  end

  # quest開始日以降の@group.users.logs.achieve_timeの合計をenemy.get_full_hpから引く
  # 結果が0未満の場合は0とする
  def get_current_hp(group)
    sum = 0
    group.users.each { |user| sum += user.get_quest_term_achieve_time }
    if sum < self.get_full_hp(group)
      self.get_full_hp(group) - sum
    else
      0
    end
  end
end
