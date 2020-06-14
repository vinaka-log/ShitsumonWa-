class Question < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'
  has_many :comments

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, validates :description, presence: true, length: { maximum: 500}

end
