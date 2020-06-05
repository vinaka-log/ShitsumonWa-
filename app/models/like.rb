class Like < ApplicationRecord

  validates :user_id, presence: true
  validates :question_id, presence: true
  belongs_to :user, counter_cache: :likes_count
  belongs_to :question
  

end
