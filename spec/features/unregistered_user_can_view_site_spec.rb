require 'spec_helper'

feature 'Unregistered user visits home page', %q{
  As an unregistered
  I want to be able to visit the site
  So that I can browse posts and reviews
} do

  before(:each) do
    visit '/posts'
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

  context 'sees a list of popular posts' do

    it 'should have review count' do

    end

    it 'should have a post title' do

    end

    it 'should have a created by user' do

    end

    it 'should have a submission date'
    it 'should have a rating'
  end
end

