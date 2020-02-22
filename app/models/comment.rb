class Comment < ApplicationRecord
  belongs_to :radio
  belongs_to :user

  validates :content,    length: { in: 1..144 }
end
