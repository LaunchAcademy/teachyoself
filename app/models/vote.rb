class Vote < ActiveRecord::Base
  validates :vote, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 1 }
  validates :user_id, uniqueness: { scope: :review_id }
  belongs_to :user
  belongs_to :review
end
