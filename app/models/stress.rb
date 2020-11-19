class Stress < ApplicationRecord
  belongs_to :user
  attachment :image
end
