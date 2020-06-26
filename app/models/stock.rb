class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, presence: true
  validates :question_id, presence: true

  def self.get_stock_posts(user)
    self.where(user_id: user.id).map(&:question)
  end
end
