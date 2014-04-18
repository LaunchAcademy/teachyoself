require 'spec_helper'

feature 'Search posts', %q{
  As a user
  I want to see a display of search results
  So that I can easily find a tutorial based on my query
} do

#Acceptance Criteria:
#
#    sees navbar to link to different sections of the website (home, tags, new post, login)
#    sees search bar to search for potential tutorials
#    view a page of list of search results sorted by number of reviews and highest ratings
#    search criteria is based on title, and tags
#    view 25 most popular posts determined by view count and net rating within last 30 days
#    ability to click through tutorials
#    views number of reviews, ratings, title, submitter, date submitted

  #before(:each) do
  # visit '/posts'
  #end

  scenario 'a user (registered or not) wishes to search for posts' do
    visit posts_path
  expect(page).to have_button 'Search'
  end

  scenario 'a user can enter text into a search box and clicking search returns a list of results' do
    doug = FactoryGirl.create(:user)
    sign_in_as(doug)
    visit new_post_path
    fill_in 'Title', with: 'Mushrooms are awfully easy to cook'
    fill_in 'URL', with: 'http://www.foodnews.com'
    fill_in 'Description', with: ''
    fill_in 'Tags', with: 'cooking, mushrooms'
    click_button('Share Tutorial')

    visit posts_path
    fill_in 'search', with: 'cook'
    click_button('Search')
    expect(page).to have_content('easy to cook')
  end

  scenario 'a user has the ability to click through to tutorials' do
    doug = FactoryGirl.create(:user)
    sign_in_as(doug)
    visit new_post_path
    fill_in 'Title', with: 'Data Structures'
    fill_in 'URL', with: 'https://www.youtube.com/watch?v=cOfhwxirhUE'
    fill_in 'Description', with: ''
    fill_in 'Tags', with: 'data, structures'
    click_button('Share Tutorial')

    visit posts_path
    fill_in 'search', with: 'data structures'
    click_button('Search')
    expect(page).to have_content('Data Structures')
    click_button('Search')
  end

  scenario 'the results are limited to 25 titles' do
    john = FactoryGirl.create(:user)
    sign_in_as(john)
    count = 1
    while count <= 30
      visit new_post_path
      fill_in 'Title', with: "General Game Playing #{count}"
      fill_in 'URL', with: 'https://www.coursera.org/course/ggp'
      fill_in 'Description', with: ''
      fill_in 'Tags', with: 'game, games'
      click_button('Share Tutorial')
      count +=1
  end

    visit posts_path
    fill_in 'search', with: 'General Game Playing'
    click_button('Search')
    expect(page).to have_content('General Game Playing')
    expect(page).to have_content('25')
    expect(page).to have_no_content('26')
    end
end
