class Record < ApplicationRecord
  belongs_to :user
  belongs_to :enemy
end
