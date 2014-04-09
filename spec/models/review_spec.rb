require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:rating) }
  it { should validate_numericality_of(:rating).is_greater_than(0).is_less_than(6) }

end
