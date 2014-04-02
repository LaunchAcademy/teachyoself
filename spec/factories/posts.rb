# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    url "MyString"
    description "MyText"
    tags "MyString"
  end
end
