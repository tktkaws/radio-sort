# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :radio, optional: true
  include RankedModel
  ranks :row_order, with_same: :user_id
end
