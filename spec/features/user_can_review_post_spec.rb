require 'spec_helper'
# require 'pry'

feature 'registered user can review a post', %q{
  As a registered user
  I want to be able to review a post
  So that my opinion can be included
} do

  # Acceptance Criteria:

  # * Can submit a rating of 1-5 on a post (once)
  # * Can submit a text review
  # * View a text prompt to submit a new review
  # * View 10 most popular existing reviews on left panel
  # * View current rating
  # * View tags
  # * View description

    scenario 'a registered user enters a review' do
      prev_count = Review.count
      doug = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post)
      sign_in_as(doug)
      visit post_path(post)
      # /posts/3/reviews/new

      select '1', from: 'review_rating'
      fill_in 'review_body', with: 'this tutorial was extremely helpful'
      click_button('Add Review')

      expect(page).to have_content('extremely helpful')
      expect(page).to have_content('Review successfully created!')
      expect(Review.count).to eq(prev_count + 1)
    end

    scenario 'a registered user enters an invalid review' do
      prev_count = Review.count
      doug = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post)
      sign_in_as(doug)
      visit post_path(post)

      click_button('Add Review')
      expect(page).to have_content('Review not created. Please enter a rating.')
      expect(Review.count).to eq(prev_count)
    end

    scenario 'an unregistered user cannot enter a review' do
      post = FactoryGirl.create(:post)
      visit post_path(post)

      expect(page).to_not have_content('Add Review')
    end
  end
