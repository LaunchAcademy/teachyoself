FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    sequence(:username) {|n| "DouglasFresh#{n}"}
    password 'password'
    password_confirmation 'password'
    avatar 'anthony.png'
  end

  factory :post do
<<<<<<< HEAD
    sequence(:title) { |n| "MyString #{n}" }
    url "http://www.google.com"
    description "MyText"
    tags "MyString"
=======
    title "Wondering how to turn your teeth from white to GOLD?"
    url "http://www.blingyomouth.com"
    description "Lil Tee & Lil Wayne show you how to bling your mouth!"
    tags "bling, mouth, tutorial, awesome"
>>>>>>> d2239f28a1c7434e4f5877197ccd0513c86b7267
    user
  end

  factory :review do
    body "MyText"
    rating 1
    user
    post
  end
end
