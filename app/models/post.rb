class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :user
end
