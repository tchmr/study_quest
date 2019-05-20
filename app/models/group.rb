class Group < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_one  :quest, dependent: :destroy
  has_one  :enemy, through: :quest
end
