# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    first_name Faker::Name.first_name
    second_name Faker::Name.name
    last_name Faker::Name.last_name
    password { generate :string }
    password_confirmation { password }

    factory :requested_user do
      confirmation_token { generate :confirmation_token }
    end

    factory :base_user do
      state :active
    end
  end
end
