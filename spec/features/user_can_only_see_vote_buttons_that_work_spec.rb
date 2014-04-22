require 'spec_helper'

feature 'A user can only see functional vote buttons' do

  it 'displays both vote up and vote down for a signed in user' do
    doug = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    review = FactoryGirl.create(:review, post: post)

    sign_in_as(doug)

    visit post_path(post)
    expect(page).to have_content("Lil Tee & Lil Wayne show you how to bling your mouth!")
    expect(page).to have_content("My Text")
    expect(page.has_button?("Vote Up")).to eq(true)
    expect(page.has_button?("Vote Down")).to eq(true)
  end

  it 'displays only the vote down button when the user has up voted' do
    doug = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    review = FactoryGirl.create(:review, post: post)

    sign_in_as(doug)

    visit post_path(post)

    click_button("Vote Up")

    expect(page.has_button?("Vote Up")).to eq(false)
    expect(page.has_button?("Vote Down")).to eq(true)
  end

  it 'displays only the vote down button when the user has up voted' do
    doug = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    review = FactoryGirl.create(:review, post: post)

    sign_in_as(doug)

    visit post_path(post)

    click_button("Vote Down")

    expect(page.has_button?("Vote Up")).to eq(true)
    expect(page.has_button?("Vote Down")).to eq(false)
  end

  it 'displays only the vote down button when the user has up voted' do
    post = FactoryGirl.create(:post)
    review = FactoryGirl.create(:review, post: post)

    visit post_path(post)

    expect(page).to have_content("you must be signed in to vote")
    expect(page.has_button?("Vote Up")).to eq(false)
    expect(page.has_button?("Vote Down")).to eq(false)
  end
end
