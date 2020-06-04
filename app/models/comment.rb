class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :question, optional: true
  validates :content, presence: true
end
