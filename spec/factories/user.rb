# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name}
    email { Faker::Internet.email  }
    encrypted_password { Faker::Crypto.sha256 }
  end
end
