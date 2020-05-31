class User < ApplicationRecord

  authenticates_with_sorcery!

  has_one_attached :image
  mount_uploader :image, ImageUploader

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
      
  validates :nationality, presence: true,length: { maximum: 45 }
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
  validates :password, confirmation: true, format: { with: VALID_PASSWORD_REGEX }

  validates :password_confirmation, presence: true, format: { with: VALID_PASSWORD_REGEX }

  has_many :questions 
  has_many :likes, dependent: :destroy
  has_many :like_questions, through: :likes, source: 'question'
  has_many :comments
  
end
