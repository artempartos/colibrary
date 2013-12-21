# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    second_name Faker::Name.name
    last_name Faker::Name.last_name
  end
end
