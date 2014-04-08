class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true
  belongs_to :user
  validates :url, url: true
end
