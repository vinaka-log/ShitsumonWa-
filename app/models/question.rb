class Question < ApplicationRecord


  validates :name, presence: true
  validates :description, presence: true


  belongs_to :user, optional: true

  mount_uploader :image, ImageUploader

end
