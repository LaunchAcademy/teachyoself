require 'spec_helper'

describe User do
  it {should validate_presence_of(:user_name)}
  it {should validate_presence_of(:email)}
end
