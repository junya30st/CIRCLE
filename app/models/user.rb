class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :likes

  has_many :messages
  
  has_many :group_users
  has_many :groups, through: :group_users

  #ユーザーとフォローする人(follower)を結びつける
  has_many :follower, class_name: 'Relationship', foreign_key: 'user_id'
  #ユーザーとフォローされる人(followed)を結びつける
  has_many :followed, class_name: 'Relationship', foreign_key: 'follow_id'

  #自分がフォローしているユーザーを簡単に取得する
  has_many :following_user, through: :follower, source: :followed
  #自分をフォローしているユーザーを簡単に取得する
  has_many :foolower_user, through: :followed, source: :follower


  #フォローするメソッド
  def follow(user_id)
      follower.create(follow_id: user_id)
  end

  #フォローを解除するメソッド
  def unfollow(user_id)
    follower.find_by(follow_id: user_id).destroy
  end

  #フォローしているか確認するメソッド
  def following?(user)
    following_user.include?(user)
  end
end
