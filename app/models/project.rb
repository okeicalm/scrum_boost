class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, length: { maximum: 1000 }
end
