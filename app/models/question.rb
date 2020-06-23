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
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    when 'dislikes'
      return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id))
    end
  end

end
