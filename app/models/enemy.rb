class Enemy < ApplicationRecord
  has_many :quests, dependent: :destroy
  has_many :groups, through: :quests
end
