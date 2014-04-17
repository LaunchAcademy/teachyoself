require 'spec_helper'


feature 'a user can upload a profile pic', %q{
  As a registered user
  I want to be able to upload an image of myself
  So that my profile page is more robust
} do

  # Acceptance Criteria:

  # A user can upload an image on their profile page
  # The image is uploaded with carrierwave/fog to Amazon S3
  # Add amazon s3 link to user database as pic-url

  before(:each) do
    @doug = FactoryGirl.create(:user)
  end

  scenario 'a logged in user visits their own profile page' do
    sign_in_as(@doug)

    visit user_path(@doug)
    attach_file('user_avatar', File.join(Rails.root, '/spec/support/herst.jpg'))
    click_button('Update User')
    expect(page).to have_content('Image uploaded successfully!')
  end

  scenario 'a logged in user can only upload a valid image type' do
    sign_in_as(@doug)

    visit user_path(@doug)
    attach_file('user_avatar', File.join(Rails.root, '/spec/support/herst.jpg'))
    click_button('Update User')
    expect(page).to have_content('Image uploaded successfully!')
  end

  scenario 'a logged in user enters an invalid image type' do
    sign_in_as(@doug)

    CSV.open("table.csv", "w") do |csv|
      csv << ["row", "of", "CSV", "data"]
    end

    visit user_path(@doug)
    attach_file('user_avatar', File.join(Rails.root, 'table.csv'))
    click_button('Update User')
    expect(page).to have_content('must be a gif, jpg, or png image.')
  end

  scenario 'a logged in user can only view upload buttons on their own profile' do
    anthony = FactoryGirl.create(:user)
    sign_in_as(@doug)

    visit user_path(anthony)
    expect(page).to_not have_content('Update User')
    expect(page).to_not have_content('Change or Update Avatar')
  end

end
