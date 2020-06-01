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
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  # < フォロー機能のメソッド>
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  
end
