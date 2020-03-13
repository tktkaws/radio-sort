# frozen_string_literal: true

class Radio < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  def liked_by?(current_user)
    likes.find_by(user_id: current_user.id)
  end
end
