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

  it 'should count the total number of up-votes' do

    review = FactoryGirl.create(:review, user: @doug)
    post = FactoryGirl.create(:post)

    (0..5).each do |x|
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:vote, user: user, review: review)
    end

    expect(@doug.up_vote_count).to eql(6)
  end

  it 'should count the total number of down-votes' do

    review = FactoryGirl.create(:review, user: @doug)
    post1 = FactoryGirl.create(:post)
    post2 = FactoryGirl.create(:post)

    (0..5).each do |x|
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:vote, vote: -1, user: user, review: review)
    end

    expect(@doug.down_vote_count).to eql(6)
    expect(Post.count).to eql(3)
    expect(Review.count).to eql(1)
  end

end
