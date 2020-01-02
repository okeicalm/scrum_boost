# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { Faker::Name.unique.name }
    description { '' }
    user

    trait :with_product_backlog do
      after(:build) do |instance|
        create(:product_backlog, project: instance)
      end
    end
  end
end
