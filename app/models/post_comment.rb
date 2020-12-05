class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :stress
  # 通知機能
  has_many :notifications, dependent: :destroy
end
