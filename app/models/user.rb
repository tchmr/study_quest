class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs, dependent: :destroy
  has_one :member, dependent: :destroy
  has_one :group, through: :member

  def get_all_term_achieve_time
    sum = 0
    self.logs.each do |log|
      sum += log.achieve_time
    end
    return sum
  end
end
