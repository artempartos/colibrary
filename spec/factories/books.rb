# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    author { generate :string }
    company nil
    isbn { generate :isbn }
    title { generate :string }
    publisher { generate :string }
  end
end
