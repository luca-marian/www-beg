# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :cost
      t.datetime :begin_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
