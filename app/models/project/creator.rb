# frozen_string_literal: true

class Project::Creator
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :user
  attribute :name, :string
  attribute :description, :string

  attr_reader :project

  validates :user, presence: true
  validates :name, presence: true

  def execute
    return false if invalid?

    persist!
    true
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.full_messages.each do |message|
      errors.add(:base, message)
    end

    false
  end

  def persist!
    ApplicationRecord.transaction do
      @project = user.projects.create!(
        name: name,
        description: description,
      )
      @project.create_product_backlog!
    end
  end
end
