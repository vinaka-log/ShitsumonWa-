class Question < ApplicationRecord


  validates :name, presence: true
  validates :description, presence: true


  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'

  mount_uploader :image, ImageUploader

end
