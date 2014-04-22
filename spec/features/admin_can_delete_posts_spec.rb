require 'spec_helper'

feature 'admin can delete a tutorial post or review', %q{
  As an admin
  I want to be able to delete posts and reviews
  So that I can control the displayed content
} do

  # * Once logged-in, sees all posts and reviews by all users
  # * Ability to delete any post
  # * Ability to delete any review

  let(:admin_user) { FactoryGirl.create(:user, admin: true) }

  before :each do
    sign_in_as(admin_user)
  end

  scenario 'an admin can delete a post' do

    post = FactoryGirl.create(:post)

    visit admin_posts_path
    prev_count = Post.count
    find(:css, "#post_ids_").set(true)
    click_on 'Delete'
    expect(Post.count).to eql(prev_count - 1)
  end

  scenario 'an admin can delete a review' do
    review = FactoryGirl.create(:review)

    visit admin_reviews_path
    prev_count = Review.count

    find(:css, "#review_ids_").set(true)
    click_on 'Delete'
    expect(Review.count).to eql(prev_count - 1)
  end

  scenario 'an admin can delete a post and its related reviews' do
    post = FactoryGirl.create(:post, id: 1)
    review1 = FactoryGirl.create(:review, post_id: 1)
    review2 = FactoryGirl.create(:review, post_id: 1)

    visit admin_posts_path
    prev_count = Review.count
    find(:css, "#post_ids_").set(true)

    click_on 'Delete'
    expect(Review.count).to eql(prev_count - 2)
  end
end
