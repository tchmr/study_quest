class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :logs, dependent: :destroy
  has_one :member, dependent: :destroy
  has_one :group, through: :member
end
