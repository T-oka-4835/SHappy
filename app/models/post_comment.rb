class PostComment < ApplicationRecord
  validates :comment, length: {minimum: 2}
  belongs_to :user
  belongs_to :stress
  # 通知機能
  has_many :notifications, dependent: :destroy
end
