class Like < ApplicationRecord
  belongs_to :user
  belongs_to :radio
  include RankedModel
  ranks :row_order , with_same: :user_id
end
