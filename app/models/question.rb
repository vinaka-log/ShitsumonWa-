class Question < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'
  has_many :comments

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500}

  def self.sort(selection)
    case selection
    when 'created_at'
      return all.order(created_at: :DESC)
    when 'updated_at'
      return all.order(updated_at: :DESC)
    when 'popularity'
      return find(Like.group(:question_id).order(Arel.sql('count(question_id) desc')).pluck(:question_id))
  end

end
