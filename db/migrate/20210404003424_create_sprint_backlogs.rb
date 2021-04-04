# frozen_string_literal: true

class CreateSprintBacklogs < ActiveRecord::Migration[6.1]
  def change
    create_table :sprint_backlogs do |t|
      t.references :product_backlog, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :initial_point_sum, null: false
      t.integer :point_sum, null: false
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false

      t.timestamps
    end
  end
end
