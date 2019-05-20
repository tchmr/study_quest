class Quest < ApplicationRecord
  belongs_to :group
  belongs_to :enemy
  validates :group_id, uniqueness: true
end
