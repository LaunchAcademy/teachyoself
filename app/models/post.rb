class Post < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true
  belongs_to :user
  validates :url, url: true

  def self.search(string)
    Post.where("title ILIKE ?", "%#{string}%").limit(25)
  end

end
