# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_one :product_backlog, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
end
