FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    sequence(:username) {|n| "DouglasFresh#{n}"}
    password 'password'
    password_confirmation 'password'
    avatar 'anthony.png'
  end

  factory :post do
    title "Wondering how to turn your teeth from white to GOLD?"
    url "http://www.blingyomouth.com"
    description "Lil Tee & Lil Wayne show you how to bling your mouth!"
    tags "bling, mouth, tutorial, awesome"
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
