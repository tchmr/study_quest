class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :user_id, uniqueness: true
end
