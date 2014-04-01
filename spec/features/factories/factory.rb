FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    user_name 'DouglasFresh'
    password 'password'
    password_confirmation 'password'
  end
end
