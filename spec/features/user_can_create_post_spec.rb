require 'spec_helper'

feature 'Registered user can create a new tutorial post', %q{
  As a registered user
  I want to be able to submit a new post tutorial
  So that I can share something useful that I found
} do

# Acceptance Criteria:

# * user will go to a new posts page
# * entry will mandate: Title, URL, and optional description and tags
# * when submitted, redirects user to post

  scenario 'a registered user enters an invalid post' do
    prev_count = Post.count
    doug = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: doug.email
    fill_in 'user_password', with: doug.password

    within('form') do
      click_on 'Sign in'
    end

    visit new_post_path

    click_button('Share Tutorial')
    expect(page).to have_content("Titlecan't be blank")
    expect(page).to have_content("URLcan't be blank")
  end

  scenario 'an unregistered user cannot create a post' do
    visit new_post_path
    expect(page).to have_content('Please sign in before posting.')
  end

  scenario 'a registered user wishes to create a valid post' do
    prev_count = Post.count
    doug = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: doug.email
    fill_in 'user_password', with: doug.password

    within('form') do
      click_on 'Sign in'
    end

    visit new_post_path

    fill_in 'Title', with: 'Mushrooms are awfully easy to cook'
    fill_in 'URL', with: 'http://www.foodnews.com'
    fill_in 'Description', with: ''
    fill_in 'Tags', with: 'cooking, mushrooms'

    click_button('Share Tutorial')

    expect(page).to have_content('Mushrooms are awfully easy to cook')
    expect(page).to have_content('http://www.foodnews.com')
    expect(page).to have_content('cooking, mushrooms')
    expect(Post.count).to eq(prev_count + 1)
    expect(Post.last.user).to eq(doug)
  end

end
