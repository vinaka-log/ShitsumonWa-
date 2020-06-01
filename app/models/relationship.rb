class Relationship < ApplicationRecord
  belongs_to :users
  belongs_to :follow, class_name: 'User'
end
