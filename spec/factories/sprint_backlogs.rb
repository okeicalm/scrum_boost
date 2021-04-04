# frozen_string_literal: true

FactoryBot.define do
  factory :sprint_backlog do
    produc_backlog
    name { 'MyString' }
    description { 'MyString' }
    initial_point_sum { 1 }
    point_sum { 1 }
  end
end
