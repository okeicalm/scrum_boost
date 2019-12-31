# frozen_string_literal: true

class CreateProductBacklogs < ActiveRecord::Migration[6.0]
  def change
    create_table(:product_backlogs) do |t|
      t.references :project, null: false
      t.timestamps
    end
  end
end
