class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than: 6
  }
  validates :user_id, presence: true
  validates :post_id, presence: true
end
