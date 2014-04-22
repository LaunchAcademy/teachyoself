class Review < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votes
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than: 6
  }
  validates :user_id, presence: true, uniqueness: true
  validates :post_id, presence: true

  def vote_sum
    votes.map{|s| s[:vote]}.reduce(0, :+)
  end
end
