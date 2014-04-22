require 'spec_helper'

describe User do

  before(:each) do
    @doug = FactoryGirl.create(:user)
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should have_many(:posts) }

  it 'should check to see if a user has voted on a review' do
    post = FactoryGirl.create(:post)
    review = FactoryGirl.create(:review, post: post)
    vote = FactoryGirl.create(:vote, user: @doug, review: review)

    expect(@doug.has_voted?(review)).to eql(true)
  end
end
