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

  scenario 'a registered user must enter a valid post' do
    prev_count = Post.count

    visit new_post_path

    fill_in 'Title', with: 'Robots have taken over Rails'
    fill_in 'URL', with: 'http://www.techcrunch.com'
    fill_in 'Description', with: 'This scares me'
    fill_in 'Tags', with: 'rails, ruby, tech'

    click_button('Share Tutorial')

    expect(page).to have_content('Robots have taken over Rails')
    expect(Post.count).to eq(prev_count + 1)
  end

  scenario 'a registered user enters an invalid post' do
    visit new_post_path

    click 'Share Tutorial'

    expect(page).to have_content('Title can not be blank.')
    expect(page).to have_content('URL can not be blank.')
  end

  scenario 'an unregistered user cannot create a post' do
    visit new_post_path
    expect(page).to have_content('Please sign in, or sign up.')
  end

  scenario 'a registered user wishes to create a post' do
    prev_count = Post.count
    doug = FactoryGirl.create(:user)
    visit '/users/sign_in'

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

    click 'Share Tutorial'

    expect(page).to have_content('Mushrooms are awfully easy to cook')
    expect(Post.count).to eq(prev_count + 1)
  end

end
