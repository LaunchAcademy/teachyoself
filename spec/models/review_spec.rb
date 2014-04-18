require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:rating) }
  it { should validate_numericality_of(:rating).is_greater_than(0).is_less_than(6) }
  it { should have_many(:votes) }

  it 'should count all votes for reviews' do
    doug = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post)
    review = FactoryGirl.create(:review, post: post)

    (0..5).each do |x|
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:vote, user: user, review: review)
    end

    expect(review.vote_sum).to eql(6)
  end
end
