FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    sequence(:username) {|n| "DouglasFresh#{n}"}
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    title "MyString"
    url "http://www.google.com"
    description "MyText"
    tags "MyString"
    user
  end

  factory :review do
    body "MyText"
    rating 1
    user
    post
  end

  factory :vote do
    vote 1
    user
    review
  end
end
