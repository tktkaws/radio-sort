class TwitterController < ApplicationController
  before_action :set_twitter_client
  before_action :authenticate_user!

  def confirm
    @tweet = tweet_rank
    @user = current_user
  end

  def tweet
    @twitter.update(tweet_rank)
    redirect_to user_path(current_user), notice: "twitterに投稿しました"
  end

  private

  def set_twitter_client
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_api_key']
      config.consumer_secret     = ENV['twitter_api_secret']
      config.access_token        = ENV['twitter_access_token']
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end

  def tweet_rank
    @likes = current_user.likes.rank(:row_order)
    string = "#ラジオソート\n\n"

    @likes.first(5).each_with_index do |like,i|
      string << "#{i+1}位: #{like.radio.title}\n"
    end
    string << "\n本番環境のurl\n"
    string
  end
end
