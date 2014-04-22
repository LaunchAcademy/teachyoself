require 'spec_helper'

describe Vote do
  it { should validate_presence_of(:vote) }
  it { should belong_to(:user) }
  it { should belong_to(:review) }
end
