class Post < ApplicationRecord

  mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :likes

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :text, presence: true
end
