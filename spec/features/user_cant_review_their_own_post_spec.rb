require 'spec_helper'

feature "A user can't review a post they created or a post they've already reviewed", %q{
  As a user
  I can't review a post I've created
  So the voting system on the review isn't skewed
} do

  before(:each) do
    @doug = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post, user: @doug)
    @review = FactoryGirl.create(:review, post: @post)
  end

  scenario "it can't review a post it created" do
    sign_in_as(@doug)
    visit post_path(@post)
    save_and_open_page
    expect(page).to_not have_content('review_rating')
    expect(page).to_not have_content('review_body')
  end

end

