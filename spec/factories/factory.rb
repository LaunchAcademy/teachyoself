FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com"}
    sequence(:username) {|n| "DouglasFresh#{n}"}
    password 'password'
    password_confirmation 'password'
  end

  factory :post do
    title "MyString"
    url "MyString"
    description "MyText"
    tags "MyString"
    user
  end
end
