class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post, :user, presence: true
end
