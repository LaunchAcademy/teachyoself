require 'spec_helper'

feature 'registered user has a profile page', %q{
  As a registered user
  I want to be able to view my profile page
  So I can see a list of posts and reviews I have contributed towards
} do

# * Acceptance criteria:
# * A user profile page will contain all posts and reviews of that given user
# * A user profile page will allow user to upload a profile picture and change it
# * The list will display the 10 most recent reviews or posts
# * It will display user role (admin or member)

  before(:each) do
    @doug = FactoryGirl.create(:user)
  end

  scenario 'a logged in user visits their own profile page' do

    sign_in_as(@doug)

    expect(page).to have_content("Profile")
  end

  scenario 'a non logged in user cannot see a link for profile' do
    visit posts_path
    expect(page).to_not have_content("Profile")
  end

  scenario 'a user can see their own statistics posts and reviews' do
    post = FactoryGirl.create(:post, user: @doug)
    reviews = FactoryGirl.create(:review, user: @doug)
    user = FactoryGirl.create(:user)
    vote = FactoryGirl.create(:vote, vote: 1, user: user, review: reviews)
    sign_in_as(@doug)
    visit user_path(@doug)

    expect(page).to have_content("Wondering how to turn your teeth from white to GOLD?")
    expect(page).to have_content("My Text")
    expect(page).to have_content(@doug.username)
    expect(page).to have_content("Posts: 1")
    expect(page).to have_content("Reviews: 1")
    expect(page).to have_content("Up Votes: 1")
    expect(page).to have_content("Down Votes: 0")
  end

end
