require 'spec_helper'

feature 'up and down vote', %q{
  As a registered user
  I want to be able to up-vote or down-vote the reviews of others
  So that I can easily agree or disagree with a review
} do

  before(:each) do
    @doug = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @review = FactoryGirl.create(:review, post: @post)
  end

  scenario 'a user should be able to vote a review' do
    sign_in_as(@doug)
    visit post_path(@post)
    count = @review.votes.count
    click_button('Vote Up')
    expect(@review.votes.count).to eql(count + 1)
  end

  scenario 'a user should be able to up vote' do
    sign_in_as(@doug)
    visit post_path(@post)
    click_button('Vote Up')
    expect(page).to have_content('Successfully saved vote.')
    within(:css, "#vote-count#{@review.id}") do
      expect(page).to have_content "1"
    end
  end

  scenario 'a user should be able to up vote' do
    sign_in_as(@doug)
    visit post_path(@post)
    click_button('Vote Down')
    expect(page).to have_content('Successfully saved vote.')
    within(:css, "#vote-count#{@review.id}") do
      expect(page).to have_content "-1"
    end
  end

  scenario 'user must be logged in to vote' do
    visit post_path(@post)
    click_button('Vote Down')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
