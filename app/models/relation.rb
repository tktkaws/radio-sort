# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :followed, class_name: 'User', optional: true
  belongs_to :follower, class_name: 'User', optional: true

  validate :follow_myself?

  def follow_myself?
    errors.add(:base, '自分をフォローすることはできません') if follower_id == followed_id
  end
end
