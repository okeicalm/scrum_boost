# frozen_string_literal: true

class SprintBacklog < ApplicationRecord
  belongs_to :product_backlog

  validates :name, presence: true
  validates :initial_point_sum, presence: true
  validates :point_sum, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
end
