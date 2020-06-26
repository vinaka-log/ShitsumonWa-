class User < ApplicationRecord
  before_save { email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_URL_REGEX = /\A#{URI::regexp(%w(http https))}\z/

  has_one_attached :image
  mount_uploader :image, ImageUploader
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications 
  has_many :questions 
  has_many :likes, dependent: :destroy
  has_many :like_questions, through: :likes, source: 'question'
  has_many :comments, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :stocks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :nationality, presence: true,length: { maximum: 45 }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :twitter, length: { maximum: 255 }, format: { with: VALID_URL_REGEX, allow_blank: true }
  validates :facebook, length: { maximum: 255 }, format: { with: VALID_URL_REGEX, allow_blank: true }
  validates :instagram, length: { maximum: 255 }, format: { with: VALID_URL_REGEX, allow_blank: true }

  def questions
    return Question.where(user_id: self.id)
  end

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
