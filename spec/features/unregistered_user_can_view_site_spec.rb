require 'spec_helper'

feature 'Unregistered user visits home page', %q{
  As an unregistered
  I want to be able to visit the site
  So that I can browse posts and reviews
} do

  before(:each) do
    visit posts_path
  end

  context 'sees a nav bar and can visit links' do
    it 'has a link called login' do
      expect(page).to have_content "Log in"
    end

    it 'has a link called new' do
      expect(page).to have_content "New"
    end

    it 'has a link called tags' do
      expect(page).to have_content "Tags"
    end

    it 'has a link called search' do
      expect(page).to have_content "Search"
    end
  end
end

