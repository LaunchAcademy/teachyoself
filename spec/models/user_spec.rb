require 'spec_helper'

describe User do

  before(:each) do
    FactoryGirl.create(:user)
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should have_many(:posts) }
end
