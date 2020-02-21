class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :radios, -> { order(position: :asc) }, through: :likes, source: :radio
  has_many :active_relations, foreign_key: 'follower_id', class_name: 'Relation', dependent: :destroy
  has_many :passive_relations, foreign_key: 'followed_id', class_name: 'Relation', dependent: :destroy
  has_many :following, through: :active_relations, source: :followed
  has_many :followers, through: :passive_relations, source: :follower

  validates :name, length: { maximum: 30 }

  enum gender: { unknown: 0, male: 1, female: 2 }
  enum age: { unanswered: 0, teenage: 1, twenties: 2, thirties: 3, forties: 4, over_fifties: 5}

  mount_uploader :image, ImageUploader



  def follow!(other_user)
    active_relations.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relations.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relations.find_by(followed_id: other_user.id).destroy
  end


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        )
    end
    user
  end


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = "111111"
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
    end
end


