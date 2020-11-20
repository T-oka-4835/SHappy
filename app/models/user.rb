class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stresses, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :events, dependent: :destroy
end
