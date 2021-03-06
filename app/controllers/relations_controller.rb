# frozen_string_literal: true

class RelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:relation][:followed_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relation.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
