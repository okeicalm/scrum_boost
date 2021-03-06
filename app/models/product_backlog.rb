# frozen_string_literal: true

class ProductBacklog < ApplicationRecord
  belongs_to :project

  validates :project, uniqueness: true
end
