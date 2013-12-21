FactoryGirl.define do
  sequence :string do |n|
    "string-#{n}"
  end

  sequence :text do |n|
    Faker::Lorem.paragraph
  end

  sequence :confirmation_token, aliases: [:uid] do |n|
    SecureRandom.urlsafe_base64
  end
end