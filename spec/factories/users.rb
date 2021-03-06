FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 7)
    password { password }
    password_confirmation { password }
  end
end