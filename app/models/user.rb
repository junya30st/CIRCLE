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

  #自分がフォローしているユーザーを取得する
  has_many :following_user, through: :follower, source: :followed
  #自分をフォローしているユーザーを取得する
  has_many :follower_user, through: :followed, source: :follower

  validates :nickname, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with:/\A[a-z0-9]+\z/i }

end
