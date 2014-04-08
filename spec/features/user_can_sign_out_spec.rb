require 'spec_helper'

feature 'user can sign out', %q{
  As a user
  I want to be able to sign out of the site
  So that I can protect my account and privacy
} do

  # Acceptance Criteria:

  # * A sign out link is available on every page of the site
  # * Clicking the sign out link signs out the user
  # * The option to re-login is available after signing out

  context 'an authenticated user should be able to sign out' do
    it 'displays a sign out link when a user signs in' do
      doug = FactoryGirl.create(:user)
      sign_in_as(doug)

      expect(page).to have_content('Sign out')
    end

    it 'destroys user session when signed out' do
      doug = FactoryGirl.create(:user)
      sign_in_as(doug)
      click_on('Sign out')

      expect(page).to have_content("Signed out successfully.")
    end
  end
end
