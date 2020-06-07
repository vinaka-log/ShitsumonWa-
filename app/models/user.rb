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
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships


  def questions
    return Question.where(user_id: self.id)
  end
  # < フォロー機能のメソッド>

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  

end
