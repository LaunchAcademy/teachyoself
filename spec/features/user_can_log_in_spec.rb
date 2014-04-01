require 'spec_helper'

feature 'user registration' do
  scenario 'a user signs up' do
    visit '/users/sign_in'
    click_on 'Sign up'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password1'
    fill_in 'user_password_confirmation', with: 'password1'
    fill_in 'user_user_name', with: 'user1'

    within('form') do
      click_on 'Sign up'
    end

    expect(page).to have_content('You have signed up successfully')
  end
end
