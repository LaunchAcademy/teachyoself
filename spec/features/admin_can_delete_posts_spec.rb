require 'spec_helper'

feature 'admin can delete a tutorial post or review', %q{
  As an admin
  I want to be able to delete posts and reviews
  So that I can control the displayed content
} do

  # * Once logged-in, sees all posts and reviews by all users
  # * Ability to delete any post
  # * Ability to delete any review

  scenario 'an admin can delete a post' do
    post = FactoryGirl.create(:post)
    prev_count = Post.count

    admin = FactoryGirl.create(:admin)
    visit

    click_on 'Delete'

    expect(Post.count).to eql(prev_count - 1)

  end


  scenario 'an admin can delete a review'
end
