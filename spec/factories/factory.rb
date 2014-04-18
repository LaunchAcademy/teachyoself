FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    sequence(:username) {|n| "DouglasFresh#{n}"}
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    sequence(:title) { |n| "MyString #{n}" }
    url "http://www.google.com"
    description "MyText"
    tags "MyString"
    user
  end

  factory :review do
    body "MyText"
    rating 1
    user_id 1
    post_id 1
  end
end
