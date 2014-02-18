FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "#{n}-#{Faker::Internet.email}"
  end

  sequence :text do |n|
    Faker::Lorem.paragraph
  end

  sequence :confirmation_token, aliases: [:uid] do |n|
    SecureRandom.urlsafe_base64
  end

  sequence :isbn do |n|
    "000-0-00000-000-0"
    [rand(100...999), rand(9), rand(10000...99999), rand(100...999), rand(9)].join('-')
  end
end
