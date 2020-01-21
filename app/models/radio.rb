class Radio < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
end
