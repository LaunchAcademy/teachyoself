require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:user) }
  it { should have_valid(:url).when('http://www.google.com', 'http://www.gizmodo.com')}
  it { should_not have_valid(:url).when('anthony decides to eat yogurt', 'www.facebook.com', 'localhost:3000')}
end
