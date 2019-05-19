class Log < ApplicationRecord
  belongs_to :user
  validates :achieve_ymd, uniqueness: { scope: :user_id }
  # validates :name, uniqueness: { scope: :year,
  #   message: "発生は年に1度までである必要があります" }
end
