require 'spec_helper'

feature 'user registration' do
  scenario 'a user signs up' do
    visit '/users/sign_in'
    click_on 'Sign up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password1'
    fill_in 'user_password_confirmation', with: 'password1'
    fill_in 'user_username', with: 'user1'

    within('form') do
      click_on 'Sign up'
    end

    expect(page).to have_content('You have signed up successfully')
  end

  scenario 'a user can sign in' do
    doug = FactoryGirl.create(:user)
    visit '/users/sign_in'

    fill_in 'Email', with: doug.email
    fill_in 'user_password', with: doug.password

    within('form') do
      click_on 'Sign in'
    end

    expect(page).to have_content('Signed in successfully')
  end

  scenario 'a user can sign in' do
    doug = FactoryGirl.create(:user)
    visit '/users/sign_in'

    fill_in 'Email', with: doug.email
    fill_in 'user_password', with: doug.password

    within('form') do
      click_on 'Sign in'
    end

    click_on 'Sign out'

    expect(page).to have_content('Signed out successfully')
  end
end
