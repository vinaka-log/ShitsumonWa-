class Question < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'
  has_many :comments, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stock_users, through: :stocks, source: :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  def self.sort(selection)
    case selection
    when 'created_at'
      all.order(created_at: :DESC)
    when 'updated_at'
      all.order(updated_at: :DESC)
    when 'popularity'
      find(Like.group(:question_id).order(Arel.sql('count(question_id) desc')).pluck(:question_id))
    end
  end

  def stock(user)
    stocks.create(user_id: user.id)
  end

  def unstock(user)
    stocks.find_by(user_id: user.id).destroy
  end

  def stocked?(user)
    stock_users.include?(user)
  end
end
