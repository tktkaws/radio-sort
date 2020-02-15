class TwitterController < ApplicationController
  before_action :set_twitter_client

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
      config.consumer_key        = Rails.application.credentials.twitter[:twitter_api_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:twitter_api_secret]
      config.access_token        = Rails.application.credentials.twitter[:twitter_access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:twitter_access_token_secret]
    end
  end

  def tweet_rank
    @likes = current_user.likes.rank(:row_order)
    likes = @likes
    <<~"EOS"
      #ラジオソート

      1位: #{likes[0].radio.title}
      2位: #{likes[1].radio.title}
      3位: #{likes[2].radio.title}
      4位: #{likes[3].radio.title}
      5位: #{likes[4].radio.title}
      
      本番環境のurl
    EOS
  end
end
