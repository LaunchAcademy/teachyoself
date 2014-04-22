class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  has_many :posts
  has_many :reviews
  has_many :votes
  validates_integrity_of :avatar
  validates_processing_of :avatar

  def has_voted?(review_obj)
    review_obj.votes.each do |vote|
      if vote.user == self
        return true
      end
    end
    false
  end

  def has_reviewed?(post)
    post.reviews.each do |review|
      if review.user == self
        return true
      end
    end
    false
  end
end

