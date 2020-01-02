# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)

    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
